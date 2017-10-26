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


  #use upsert (Repo.insert_or_update)?
  #TODO get all exchangepairs and rates
    # from cryptowatch api
    #TODO upsert into DB
  #TODO perform every x seconds?

end
