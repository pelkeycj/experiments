defmodule TestPollingWeb.PageController do
  use TestPollingWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
