defmodule CoinwatchApi.Assets.ExchangePair do
  use Ecto.Schema
  import Ecto.Changeset
  alias CoinwatchApi.Assets.ExchangePair


  schema "exchangepairs" do
    field :exchange, :string
    field :pair, :string
    field :rate, :decimal

    timestamps()
  end

  @doc false
  def changeset(%ExchangePair{} = exchange_pair, attrs) do
    exchange_pair
    |> cast(attrs, [:exchange, :pair, :rate])
    |> validate_required([:exchange, :pair])
  end
end