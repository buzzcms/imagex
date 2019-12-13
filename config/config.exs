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

config :ueberauth, Ueberauth,
  json_library: Jason,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [callback_methods: ["POST"]]},
    facebook: {Ueberauth.Strategy.Facebook, []}
  ]

config :imagex, Imagex.Auth.Guardian,
  issuer: "imagex",
  secret_key: "eyybqzMu3LJRYHGjKBl+GevxnGaXqjzZomabh9ax7zt5spp0rgYKWnPX4dSNN/8r"

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: "1690946351207352",
  client_secret: "0a7a5bc1f09fa8f0a71cfb1630e8bf3b"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
