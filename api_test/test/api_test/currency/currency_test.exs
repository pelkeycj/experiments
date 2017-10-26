defmodule ApiTest.CurrencyTest do
  use ApiTest.DataCase

  alias ApiTest.Currency

  describe "assets" do
    alias ApiTest.Currency.Asset

    @valid_attrs %{altname: "some altname", name: "some name"}
    @update_attrs %{altname: "some updated altname", name: "some updated name"}
    @invalid_attrs %{altname: nil, name: nil}

    def asset_fixture(attrs \\ %{}) do
      {:ok, asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Currency.create_asset()

      asset
    end

    test "list_assets/0 returns all assets" do
      asset = asset_fixture()
      assert Currency.list_assets() == [asset]
    end

    test "get_asset!/1 returns the asset with given id" do
      asset = asset_fixture()
      assert Currency.get_asset!(asset.id) == asset
    end

    test "create_asset/1 with valid data creates a asset" do
      assert {:ok, %Asset{} = asset} = Currency.create_asset(@valid_attrs)
      assert asset.altname == "some altname"
      assert asset.name == "some name"
    end

    test "create_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Currency.create_asset(@invalid_attrs)
    end

    test "update_asset/2 with valid data updates the asset" do
      asset = asset_fixture()
      assert {:ok, asset} = Currency.update_asset(asset, @update_attrs)
      assert %Asset{} = asset
      assert asset.altname == "some updated altname"
      assert asset.name == "some updated name"
    end

    test "update_asset/2 with invalid data returns error changeset" do
      asset = asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Currency.update_asset(asset, @invalid_attrs)
      assert asset == Currency.get_asset!(asset.id)
    end

    test "delete_asset/1 deletes the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{}} = Currency.delete_asset(asset)
      assert_raise Ecto.NoResultsError, fn -> Currency.get_asset!(asset.id) end
    end

    test "change_asset/1 returns a asset changeset" do
      asset = asset_fixture()
      assert %Ecto.Changeset{} = Currency.change_asset(asset)
    end
  end
end
