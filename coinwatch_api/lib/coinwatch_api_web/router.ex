defmodule CoinwatchApiWeb.Router do
  use CoinwatchApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end



  #TODO probably remove this and all views, etc
  #scope "/", CoinwatchApiWeb do
  #  pipe_through :browser # Use the default browser stack

  #  get "/", PageController, :index
  #end

  # Other scopes may use custom stacks.
   scope "/api", CoinwatchApiWeb do
     pipe_through :api

     resources "/exchangepairs", ExchangePairController, except: [:new, :edit]
   end
end
