defmodule CoinwatchApiWeb.ExchangePairView do
  use CoinwatchApiWeb, :view
  alias CoinwatchApiWeb.ExchangePairView

  def render("index.json", %{exchangepairs: exchangepairs}) do
    %{data: render_many(exchangepairs, ExchangePairView, "exchange_pair.json")}
  end

  def render("show.json", %{exchange_pair: exchange_pair}) do
    %{data: render_one(exchange_pair, ExchangePairView, "exchange_pair.json")}
  end

  def render("exchange_pair.json", %{exchange_pair: exchange_pair}) do
    %{id: exchange_pair.id,
      exchange: exchange_pair.exchange,
      pair: exchange_pair.pair,
      rate: exchange_pair.rate}
  end
end
