defmodule Contacts.Repo do
  use Ecto.Repo,
      otp_app: :contacts,
      adapter: Sqlite.Ecto2
end