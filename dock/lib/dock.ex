defmodule Dock do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    host = System.get_env("MQTT_SERVER")
    port = System.get_env("MQTT_SERVER_PORT")
    topic = System.get_env("MQTT_TOPIC")

    Tortoise.Supervisor.start_child(
      client_id: "contacts",
      handler: {Deploy.Handler, []},
      server: {Tortoise.Transport.Tcp, host: host, port: 1883},
      subscriptions: [{topic, 0}])

    children = [

    ]

    opts = [strategy: :one_for_one, name: Main.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
