defmodule CoinwatchApi.Repo.Migrations.CreateExchangepairs do
  use Ecto.Migration

  def change do
    create table(:exchangepairs) do
      add :exchange, :string, null: false
      add :pair, :string, null: false
      add :rate, :decimal, default: 0, null: false

      timestamps()
    end

    create unique_index(:exchangepairs, [:exchange, :pair])
  end
end
