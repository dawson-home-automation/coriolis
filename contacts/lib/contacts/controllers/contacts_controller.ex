defmodule Contacts.ContactsController do
  use Contacts, :controller

  import Ecto.Query

  def get_contacts(conn, _params) do
    contacts = get_contacts()

    json conn, contacts
  end

  def add_contact(device) do
    Contacts.Repo.insert(%Contacts.Device{name: device.name, link: device.link})
  end

  defp get_contacts() do
    Contacts.Repo.all(
      Contacts.Device |>
        select([device], %{name: device.name, link: device.link})
    )
  end

end
