use Mix.Config

# Configures the endpoint
config :contacts, Contacts.Endpoint,
  url: [host: "0.0.0.0"],
  secret_key_base: "HEY05EB1dFVSu6KykKHuS4rQPQzSHv4F7mGVB/gnDLrIu75wE/ytBXy2TaL3A6RA",
  render_errors: [view: Contacts.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ui.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :contacts, Contacts.Repo,
       adapter: Sqlite.Ecto2,
       database: "contacts.sqlite3"

config :contacts, ecto_repos: [Contacts.Repo]

# Configures Elixir's Logger
config :logger, :console,
format: "$time $metadata[$level] $message\n",
metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
