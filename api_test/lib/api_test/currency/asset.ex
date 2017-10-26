defmodule ApiTest.Currency.Asset do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiTest.Currency.Asset

  #TODO name and altname should be unique

  schema "assets" do
    field :name, :string
    field :rate, :decimal

    timestamps()
  end

  @doc false
  def changeset(%Asset{} = asset, attrs) do
    asset
    |> cast(attrs, [:name, :rate])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

end
