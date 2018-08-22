use Mix.Config

config :contacts, Contacts.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
