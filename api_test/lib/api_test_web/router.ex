defmodule ApiTestWeb.Router do
  use ApiTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", ApiTestWeb do
    pipe_through :api

    resources "/assets", AssetController
    #TODO users
  end
end
