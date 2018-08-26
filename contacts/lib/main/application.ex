defmodule Main.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    host = System.get_env("MQTT_SERVER")
    port = System.get_env("MQTT_SERVER_PORT")
    topic = System.get_env("MQTT_TOPIC")

    IO.puts("#{host} - #{port} - #{topic}")

    Tortoise.Supervisor.start_child(
      client_id: "contacts",
      handler: {DeviceRegistry.Handler, []},
      server: {Tortoise.Transport.Tcp, host: host, port: 1883},
      subscriptions: [{topic, 0}])

    children = [
      supervisor(Contacts.Endpoint, []),
      supervisor(Contacts.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Main.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Contacts.Endpoint.config_change(changed, removed)
    :ok
  end

end
