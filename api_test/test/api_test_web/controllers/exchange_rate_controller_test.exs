defmodule ApiTestWeb.ExchangeRateControllerTest do
  use ApiTestWeb.ConnCase

  alias ApiTest.Assets
  alias ApiTest.Assets.ExchangeRate

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:exchange_rate) do
    {:ok, exchange_rate} = Assets.create_exchange_rate(@create_attrs)
    exchange_rate
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exchangerates", %{conn: conn} do
      conn = get conn, exchange_rate_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exchange_rate" do
    test "renders exchange_rate when data is valid", %{conn: conn} do
      conn = post conn, exchange_rate_path(conn, :create), exchange_rate: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, exchange_rate_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, exchange_rate_path(conn, :create), exchange_rate: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exchange_rate" do
    setup [:create_exchange_rate]

    test "renders exchange_rate when data is valid", %{conn: conn, exchange_rate: %ExchangeRate{id: id} = exchange_rate} do
      conn = put conn, exchange_rate_path(conn, :update, exchange_rate), exchange_rate: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, exchange_rate_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, exchange_rate: exchange_rate} do
      conn = put conn, exchange_rate_path(conn, :update, exchange_rate), exchange_rate: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exchange_rate" do
    setup [:create_exchange_rate]

    test "deletes chosen exchange_rate", %{conn: conn, exchange_rate: exchange_rate} do
      conn = delete conn, exchange_rate_path(conn, :delete, exchange_rate)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, exchange_rate_path(conn, :show, exchange_rate)
      end
    end
  end

  defp create_exchange_rate(_) do
    exchange_rate = fixture(:exchange_rate)
    {:ok, exchange_rate: exchange_rate}
  end
end
