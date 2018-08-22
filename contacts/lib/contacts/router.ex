defmodule Contacts.Router do
  use Contacts, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Contacts do
     pipe_through :api

     get "/contacts", ContactsController, :get_contacts
  end

end
