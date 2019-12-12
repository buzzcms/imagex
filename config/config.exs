# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :imagex,
  ecto_repos: [Imagex.Repo]

# Configures the endpoint
config :imagex, ImagexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VZfXCUP7lvAvOGcgmsgcqqOPUlQz/eqoin9q0mj2L09VPzO5cAh6e7n/ghhCd+eK",
  render_errors: [view: ImagexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Imagex.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
