defmodule Contacts.ContactsController do
  use Contacts, :controller

  def get_contacts(conn, _params) do
    contacts = []

    json conn, contacts
  end

end
