defmodule ApiTestWeb.ExchangeRateView do
  use ApiTestWeb, :view
  alias ApiTestWeb.ExchangeRateView

  def render("index.json", %{exchangerates: exchangerates}) do
    %{data: render_many(exchangerates, ExchangeRateView, "exchange_rate.json")}
  end

  def render("show.json", %{exchange_rate: exchange_rate}) do
    %{data: render_one(exchange_rate, ExchangeRateView, "exchange_rate.json")}
  end

  def render("exchange_rate.json", %{exchange_rate: exchange_rate}) do
    %{id: exchange_rate.id}
  end
end
