defmodule CoinwatchApiWeb.ExchangePairControllerTest do
  use CoinwatchApiWeb.ConnCase

  alias CoinwatchApi.Assets
  alias CoinwatchApi.Assets.ExchangePair

  @create_attrs %{exchange: "some exchange", pair: "some pair", rate: "120.5"}
  @update_attrs %{exchange: "some updated exchange", pair: "some updated pair", rate: "456.7"}
  @invalid_attrs %{exchange: nil, pair: nil, rate: nil}

  def fixture(:exchange_pair) do
    {:ok, exchange_pair} = Assets.create_exchange_pair(@create_attrs)
    exchange_pair
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exchangepairs", %{conn: conn} do
      conn = get conn, exchange_pair_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exchange_pair" do
    test "renders exchange_pair when data is valid", %{conn: conn} do
      conn = post conn, exchange_pair_path(conn, :create), exchange_pair: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, exchange_pair_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "exchange" => "some exchange",
        "pair" => "some pair",
        "rate" => "120.5"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, exchange_pair_path(conn, :create), exchange_pair: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exchange_pair" do
    setup [:create_exchange_pair]

    test "renders exchange_pair when data is valid", %{conn: conn, exchange_pair: %ExchangePair{id: id} = exchange_pair} do
      conn = put conn, exchange_pair_path(conn, :update, exchange_pair), exchange_pair: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, exchange_pair_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "exchange" => "some updated exchange",
        "pair" => "some updated pair",
        "rate" => "456.7"}
    end

    test "renders errors when data is invalid", %{conn: conn, exchange_pair: exchange_pair} do
      conn = put conn, exchange_pair_path(conn, :update, exchange_pair), exchange_pair: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exchange_pair" do
    setup [:create_exchange_pair]

    test "deletes chosen exchange_pair", %{conn: conn, exchange_pair: exchange_pair} do
      conn = delete conn, exchange_pair_path(conn, :delete, exchange_pair)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, exchange_pair_path(conn, :show, exchange_pair)
      end
    end
  end

  defp create_exchange_pair(_) do
    exchange_pair = fixture(:exchange_pair)
    {:ok, exchange_pair: exchange_pair}
  end
end
