defmodule Contacts.Device do
  use Ecto.Schema

  schema "devices" do
    field :name, :string
    field :ip, :string
    field :target, :string
    timestamps()
  end

end
