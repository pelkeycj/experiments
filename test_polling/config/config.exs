# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :test_polling,
  ecto_repos: [TestPolling.Repo]

# Configures the endpoint
config :test_polling, TestPollingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NM2eyAwKnzMuc4XBUKX1xn+ooH+skDeodAxySw0XqC5EmBksGfvv/UqyBLP39bF/",
  render_errors: [view: TestPollingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestPolling.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :test_polling, TestPolling.Scheduler,
  jobs: [
    #every second
    {{:extended, "* * * * *"}, {IO, :puts, ["test"]}}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
