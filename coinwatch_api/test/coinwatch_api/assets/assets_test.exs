defmodule CoinwatchApi.AssetsTest do
  use CoinwatchApi.DataCase

  alias CoinwatchApi.Assets

  describe "exchangepairs" do
    alias CoinwatchApi.Assets.ExchangePair

    @valid_attrs %{exchange: "some exchange", pair: "some pair", rate: "120.5"}
    @update_attrs %{exchange: "some updated exchange", pair: "some updated pair", rate: "456.7"}
    @invalid_attrs %{exchange: nil, pair: nil, rate: nil}

    def exchange_pair_fixture(attrs \\ %{}) do
      {:ok, exchange_pair} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_exchange_pair()

      exchange_pair
    end

    test "list_exchangepairs/0 returns all exchangepairs" do
      exchange_pair = exchange_pair_fixture()
      assert Assets.list_exchangepairs() == [exchange_pair]
    end

    test "get_exchange_pair!/1 returns the exchange_pair with given id" do
      exchange_pair = exchange_pair_fixture()
      assert Assets.get_exchange_pair!(exchange_pair.id) == exchange_pair
    end

    test "create_exchange_pair/1 with valid data creates a exchange_pair" do
      assert {:ok, %ExchangePair{} = exchange_pair} = Assets.create_exchange_pair(@valid_attrs)
      assert exchange_pair.exchange == "some exchange"
      assert exchange_pair.pair == "some pair"
      assert exchange_pair.rate == Decimal.new("120.5")
    end

    test "create_exchange_pair/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_exchange_pair(@invalid_attrs)
    end

    test "update_exchange_pair/2 with valid data updates the exchange_pair" do
      exchange_pair = exchange_pair_fixture()
      assert {:ok, exchange_pair} = Assets.update_exchange_pair(exchange_pair, @update_attrs)
      assert %ExchangePair{} = exchange_pair
      assert exchange_pair.exchange == "some updated exchange"
      assert exchange_pair.pair == "some updated pair"
      assert exchange_pair.rate == Decimal.new("456.7")
    end

    test "update_exchange_pair/2 with invalid data returns error changeset" do
      exchange_pair = exchange_pair_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_exchange_pair(exchange_pair, @invalid_attrs)
      assert exchange_pair == Assets.get_exchange_pair!(exchange_pair.id)
    end

    test "delete_exchange_pair/1 deletes the exchange_pair" do
      exchange_pair = exchange_pair_fixture()
      assert {:ok, %ExchangePair{}} = Assets.delete_exchange_pair(exchange_pair)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_exchange_pair!(exchange_pair.id) end
    end

    test "change_exchange_pair/1 returns a exchange_pair changeset" do
      exchange_pair = exchange_pair_fixture()
      assert %Ecto.Changeset{} = Assets.change_exchange_pair(exchange_pair)
    end
  end
end
