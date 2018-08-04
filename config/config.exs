# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_ajax,
  ecto_repos: [PhoenixAjax.Repo]

# Configures the endpoint
config :phoenix_ajax, PhoenixAjaxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oBKxHhQXHiLZW/P6eoxHIB7Pu/UT2IT3sotyJQ8c7DvHCEaeXsWqvVdz7ohWyr63",
  render_errors: [view: PhoenixAjaxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixAjax.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
