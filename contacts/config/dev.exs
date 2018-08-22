use Mix.Config

config :contacts, Contacts.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  check_origin: false

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
