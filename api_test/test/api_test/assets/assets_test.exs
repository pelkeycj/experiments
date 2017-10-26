defmodule ApiTest.AssetsTest do
  use ApiTest.DataCase

  alias ApiTest.Assets

  describe "exchangerates" do
    alias ApiTest.Assets.ExchangeRate

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def exchange_rate_fixture(attrs \\ %{}) do
      {:ok, exchange_rate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_exchange_rate()

      exchange_rate
    end

    test "list_exchangerates/0 returns all exchangerates" do
      exchange_rate = exchange_rate_fixture()
      assert Assets.list_exchangerates() == [exchange_rate]
    end

    test "get_exchange_rate!/1 returns the exchange_rate with given id" do
      exchange_rate = exchange_rate_fixture()
      assert Assets.get_exchange_rate!(exchange_rate.id) == exchange_rate
    end

    test "create_exchange_rate/1 with valid data creates a exchange_rate" do
      assert {:ok, %ExchangeRate{} = exchange_rate} = Assets.create_exchange_rate(@valid_attrs)
    end

    test "create_exchange_rate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_exchange_rate(@invalid_attrs)
    end

    test "update_exchange_rate/2 with valid data updates the exchange_rate" do
      exchange_rate = exchange_rate_fixture()
      assert {:ok, exchange_rate} = Assets.update_exchange_rate(exchange_rate, @update_attrs)
      assert %ExchangeRate{} = exchange_rate
    end

    test "update_exchange_rate/2 with invalid data returns error changeset" do
      exchange_rate = exchange_rate_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_exchange_rate(exchange_rate, @invalid_attrs)
      assert exchange_rate == Assets.get_exchange_rate!(exchange_rate.id)
    end

    test "delete_exchange_rate/1 deletes the exchange_rate" do
      exchange_rate = exchange_rate_fixture()
      assert {:ok, %ExchangeRate{}} = Assets.delete_exchange_rate(exchange_rate)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_exchange_rate!(exchange_rate.id) end
    end

    test "change_exchange_rate/1 returns a exchange_rate changeset" do
      exchange_rate = exchange_rate_fixture()
      assert %Ecto.Changeset{} = Assets.change_exchange_rate(exchange_rate)
    end
  end
end
