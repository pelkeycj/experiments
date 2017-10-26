defmodule ApiTest.Currency do
  @moduledoc """
  The Currency context.
  """

  import Ecto.Query, warn: false
  alias ApiTest.Repo

  alias ApiTest.Currency.Asset

  @doc """
  Returns the list of assets.

  ## Examples

      iex> list_assets()
      [%Asset{}, ...]

  """
  def list_assets do
    Repo.all(Asset)
  end

  @doc """
  Gets a single asset.

  Raises `Ecto.NoResultsError` if the Asset does not exist.

  ## Examples

      iex> get_asset!(123)
      %Asset{}

      iex> get_asset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_asset!(id), do: Repo.get!(Asset, id)

  @doc """
  Creates a asset.

  ## Examples

      iex> create_asset(%{field: value})
      {:ok, %Asset{}}

      iex> create_asset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_asset(attrs \\ %{}) do
    %Asset{}
    |> Asset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a asset.

  ## Examples

      iex> update_asset(asset, %{field: new_value})
      {:ok, %Asset{}}

      iex> update_asset(asset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_asset(%Asset{} = asset, attrs) do
    asset
    |> Asset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Asset.

  ## Examples

      iex> delete_asset(asset)
      {:ok, %Asset{}}

      iex> delete_asset(asset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_asset(%Asset{} = asset) do
    Repo.delete(asset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking asset changes.

  ## Examples

      iex> change_asset(asset)
      %Ecto.Changeset{source: %Asset{}}

  """
  def change_asset(%Asset{} = asset) do
    Asset.changeset(asset, %{})
  end

  #### KRAKEN API URLs ####
  def asset_pairs_URL() do
    "https://api.kraken.com/0/public/AssetPairs"
  end

  def ticker_URL() do
    "https://api.kraken.com/0/public/Ticker"
  end


  #TODO test in real app?
  #initial population
  def populate_assets_from_kraken() do
    with {:ok, asset_pairs} <- get_from_kraken(asset_pairs_URL()) do
      asset_pairs
      |> Map.keys()
      |> Enum.map(fn name ->
        ApiTest.Currency.create_asset(%{name: name})
      end)
    end
  end

  # TODO test in real app
  def get_from_kraken(url) do
    raw = HTTPoison.get!(url)
    with {:ok, map} <- Poison.decode(raw.body) do
      Map.fetch(map, "result")
    end
  end

  #assemble list of tickers for a get request to kraken API
  # format: '{ "pair" : "ticker1, ticker2, ticker3" }'
  def ticker_list() do
    assets = list_assets()
    assets
    |> Enum.map(fn asset ->
        asset.name
        end)
    |> Enum.join(", ")
    #|> (fn assets ->
    #  Poison.encode(%{"Pair" => assets})
    #end).()
    |> (fn x ->
        "{ \"pair\" : \"" <> x <> "\" }"
        end).()
  end

  #TODO test in real app
  #TODO this needs to be scheduled to occur every ~5 seconds
  # get from kraken
  # for each, update asset_pair
  # eventually, push to channel (not during this experiment)
  def update_asset_rates() do
    IO.inspect(ticker_list())
    with {:ok, ticker_rates} <- HTTPoison.request!(:get, ticker_URL(), ticker_list()) do
      IO.inspect(ticker_rates)
    end
  end


end
