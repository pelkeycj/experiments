defmodule ApiTest.Repo.Migrations.CreateAssets do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :name, :string
      add :rate, :decimal, default: 0, null: false

      timestamps()
    end
  end
end
