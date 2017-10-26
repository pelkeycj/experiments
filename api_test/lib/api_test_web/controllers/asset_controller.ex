defmodule ApiTestWeb.AssetController do
  use ApiTestWeb, :controller

  alias ApiTest.Currency
  alias ApiTest.Currency.Asset

  action_fallback ApiTestWeb.FallbackController

  def index(conn, _params) do
    assets = Currency.list_assets()
    render(conn, "index.json", assets: assets)
  end

  def create(conn, %{"asset" => asset_params}) do
    with {:ok, %Asset{} = asset} <- Currency.create_asset(asset_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", asset_path(conn, :show, asset))
      |> render("show.json", asset: asset)
    end
  end

  def show(conn, %{"id" => id}) do
    asset = Currency.get_asset!(id)
    render(conn, "show.json", asset: asset)
  end

  def update(conn, %{"id" => id, "asset" => asset_params}) do
    asset = Currency.get_asset!(id)

    with {:ok, %Asset{} = asset} <- Currency.update_asset(asset, asset_params) do
      render(conn, "show.json", asset: asset)
    end
  end

  def delete(conn, %{"id" => id}) do
    asset = Currency.get_asset!(id)
    with {:ok, %Asset{}} <- Currency.delete_asset(asset) do
      send_resp(conn, :no_content, "")
    end
  end
end
