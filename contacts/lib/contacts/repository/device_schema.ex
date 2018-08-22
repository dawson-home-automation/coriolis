defmodule Contacts.Device do
  use Ecto.Schema

  schema "devices" do
    field :name, :string
    field :link, :string
    timestamps()
  end

end
