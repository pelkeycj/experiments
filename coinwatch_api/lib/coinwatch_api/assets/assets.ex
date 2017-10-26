defmodule CoinwatchApi.Assets do
  @moduledoc """
  The Assets context.
  """

  import Ecto.Query, warn: false
  alias CoinwatchApi.Repo

  alias CoinwatchApi.Assets.ExchangePair

  @doc """
  Returns the list of exchangepairs.

  ## Examples

      iex> list_exchangepairs()
      [%ExchangePair{}, ...]

  """
  def list_exchangepairs do
    Repo.all(ExchangePair)
  end

  @doc """
  Gets a single exchange_pair.

  Raises `Ecto.NoResultsError` if the Exchange pair does not exist.

  ## Examples

      iex> get_exchange_pair!(123)
      %ExchangePair{}

      iex> get_exchange_pair!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exchange_pair!(id), do: Repo.get!(ExchangePair, id)

  @doc """
  Creates a exchange_pair.

  ## Examples

      iex> create_exchange_pair(%{field: value})
      {:ok, %ExchangePair{}}

      iex> create_exchange_pair(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exchange_pair(attrs \\ %{}) do
    %ExchangePair{}
    |> ExchangePair.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exchange_pair.

  ## Examples

      iex> update_exchange_pair(exchange_pair, %{field: new_value})
      {:ok, %ExchangePair{}}

      iex> update_exchange_pair(exchange_pair, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exchange_pair(%ExchangePair{} = exchange_pair, attrs) do
    exchange_pair
    |> ExchangePair.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ExchangePair.

  ## Examples

      iex> delete_exchange_pair(exchange_pair)
      {:ok, %ExchangePair{}}

      iex> delete_exchange_pair(exchange_pair)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exchange_pair(%ExchangePair{} = exchange_pair) do
    Repo.delete(exchange_pair)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exchange_pair changes.

  ## Examples

      iex> change_exchange_pair(exchange_pair)
      %Ecto.Changeset{source: %ExchangePair{}}

  """
  def change_exchange_pair(%ExchangePair{} = exchange_pair) do
    ExchangePair.changeset(exchange_pair, %{})
  end

  #Returns the current price for all supported markets in JSON.
  #Some values may be out of date by a few seconds.
  #### Data is in the form "EXCHANGE:PAIR" : PRICE in a list
  def markets_prices_URL() do
    "https://api.cryptowat.ch/markets/prices"
  end

  # Returns the market summary for all supported markets.
  # Some values may be out of date by a few seconds.
  def markets_summary_URL() do
    "https://api.cryptowat.ch/markets/summaries"
  end

  def get_decoded_URL(url) do
    res = HTTPoison.get!(url)
    Poison.decode(res.body)
  end

  def isolate_result(res) do
    with {:ok, result} <- Map.fetch(res, "result") do
      result
    end
  end

  @doc """
    Gets all markets and their prices. For each obtained data,
    an ExchangePair is either updated or created to contain the latest
    price information.
  """
  def upsert_exchange_pairs() do
    with {:ok, map} <- get_decoded_URL(markets_prices_URL()) do
      map
      |> isolate_result()
      |> Enum.each(fn {k, v} ->
        upsert_pair(k, v)
      end)
    end
  end


  @doc """
    Updates or inserts an ExchangePairs rate.
    market is in the form "EXCHANGE:PAIR".
  """
  def upsert_pair(market, rate) do
    list = String.split(market, ":")
    exchange = List.first(list)
    pair = List.last(list)

    if String.length(pair) == 6 do
      get_or_create(exchange, pair, rate)
      |> ExchangePair.changeset(%{rate: rate})
      |> Repo.insert_or_update()
      |> broadcast_changes()
    end
  end

  @doc """
    Retrieves an existing ExchangePair matching the exchange and pair
    arguments or creates a new one if nonexistent.
  """
  def get_or_create(exchange, pair, rate) do
    case Repo.get_by(ExchangePair, exchange: exchange, pair: pair) do
      nil -> # none exists
        %ExchangePair{exchange: exchange, pair: pair, rate: rate}
      expair ->
        IO.puts(exchange <> ":" <> pair)
        IO.inspect(rate)
        IO.inspect(expair)
        expair
    end
  end

  @doc """
    Broadcasts rate changes to users who follow the market.
  """
  def broadcast_changes(expair) do
    #TODO for main app broadcast to users who follow expair
    # FOR this experiment, inspect in console
    expair
  end



end
