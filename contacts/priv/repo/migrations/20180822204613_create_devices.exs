defmodule Contacts.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :name, :string
      add :ip, :string
      add :target, :string
      timestamps()
    end
  end
end
