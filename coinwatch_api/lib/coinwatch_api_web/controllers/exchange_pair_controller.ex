defmodule CoinwatchApiWeb.ExchangePairController do
  use CoinwatchApiWeb, :controller

  alias CoinwatchApi.Assets
  alias CoinwatchApi.Assets.ExchangePair

  action_fallback CoinwatchApiWeb.FallbackController

  def index(conn, _params) do
    exchangepairs = Assets.list_exchangepairs()
    render(conn, "index.json", exchangepairs: exchangepairs)
  end

  def create(conn, %{"exchange_pair" => exchange_pair_params}) do
    with {:ok, %ExchangePair{} = exchange_pair} <- Assets.create_exchange_pair(exchange_pair_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", exchange_pair_path(conn, :show, exchange_pair))
      |> render("show.json", exchange_pair: exchange_pair)
    end
  end

  def show(conn, %{"id" => id}) do
    exchange_pair = Assets.get_exchange_pair!(id)
    render(conn, "show.json", exchange_pair: exchange_pair)
  end

  def update(conn, %{"id" => id, "exchange_pair" => exchange_pair_params}) do
    exchange_pair = Assets.get_exchange_pair!(id)

    with {:ok, %ExchangePair{} = exchange_pair} <- Assets.update_exchange_pair(exchange_pair, exchange_pair_params) do
      render(conn, "show.json", exchange_pair: exchange_pair)
    end
  end

  def delete(conn, %{"id" => id}) do
    exchange_pair = Assets.get_exchange_pair!(id)
    with {:ok, %ExchangePair{}} <- Assets.delete_exchange_pair(exchange_pair) do
      send_resp(conn, :no_content, "")
    end
  end
end
