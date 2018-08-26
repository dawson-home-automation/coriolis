defmodule Contacts.Device do
  use Ecto.Schema

  @primary_key {:name, :string, autogenerate: false}
  schema "devices" do
    field :ip, :string
    field :target, :string
    timestamps()
  end

end
