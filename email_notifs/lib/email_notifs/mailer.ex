defmodule EmailNotifs.Mailer do
  use Mailgun.Client,
      domain: Application.get_env(:email_notifs, :mailgun_domain),
      key: Application.get_env(:email_notifs, :mailgun_key)#,
      #mode: :test,
      #test_file_path: "/tmp/mailgun.json"

  @from "coinwatch@mg.jdcrouse.org"


  def send_price_alert_email(addr) do
    send_email to: addr,
               from: @from,
               subject: "Price Alert for BTCUSD",
               text: "The price for BTCUSD has reached or exceeded your desired alert value of $6000! Sell now or regret not doing so."
  end






end
