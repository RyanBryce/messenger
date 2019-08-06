# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :messenger,
  ecto_repos: [Messenger.Repo]

# Configures the endpoint
config :messenger, MessengerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RM734u9kn++GqkmKlf4U3rrl5slbaW76He3WprgtkNsJ4uNubA9T6IMwZUmrdKEr",
  render_errors: [view: MessengerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Messenger.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# configures Ex_twillio
config :ex_twilio,
  account_sid: System.get_env("TWILIO_ACCOUNT_SID"),
  auth_token: System.get_env("TWILIO_AUTH_TOKEN")

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
