use Mix.Config

config :logger, level: :info

config :contacts, Contacts.Repo,
       adapter: Sqlite.Ecto2,
       database: "/root/contacts.sqlite3"