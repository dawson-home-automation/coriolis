defmodule Contacts.ContactsController do
  use Contacts, :controller

  def get_contacts(conn, _params) do
    contacts = get_contacts()

    json conn, contacts
  end

  defp get_contacts() do
    [%{name: "test", ip: "192.168.0.1"}]
  end

end
