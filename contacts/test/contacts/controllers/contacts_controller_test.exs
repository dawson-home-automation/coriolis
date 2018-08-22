defmodule Contacts.ContactsControllerTest do
  use Contacts.ConnCase

  test "GET /api/contacts", %{conn: conn} do
    conn = get conn, "/api/contacts"

    body = json_response(conn, 200)
    assert body == []
  end

end
