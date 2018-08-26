defmodule Contacts.ContactsController do
  use Contacts, :controller

  import Ecto.Query

  def get_contacts(conn, _params) do
    contacts = get_contacts()

    json conn, contacts
  end

  def add_contact(device) do
    from(c in Contacts.Device, where: c.name == ^device.name) |> Contacts.Repo.delete_all
    
    Contacts.Repo.insert(%Contacts.Device{name: device.name, ip: device.ip, target: device.target})
  end

  defp get_contacts() do
    Contacts.Repo.all(
      Contacts.Device |>
        select([device], %{name: device.name, ip: device.ip, target: device.target})
    )
  end

end
