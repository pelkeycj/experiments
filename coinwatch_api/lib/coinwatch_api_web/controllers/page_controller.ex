defmodule CoinwatchApiWeb.PageController do
  use CoinwatchApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
