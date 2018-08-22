defmodule Contacts.ContactsControllerTest do
  use Contacts.ConnCase

  test "GET /api/contacts", %{conn: conn} do
    conn = get conn, "/api/contacts"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

end
