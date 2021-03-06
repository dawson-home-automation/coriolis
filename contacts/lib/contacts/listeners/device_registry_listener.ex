defmodule DeviceRegistry.Handler do
  @moduledoc false

  require Logger
  require Poison

  defstruct []
  alias __MODULE__, as: State

  @behaviour Tortoise.Handler

  @impl true
  def init(_opts) do
    {:ok, %State{}}
  end

  @impl true
  def connection(:up, state) do
    Logger.info("Connection has been established")
    {:ok, state}
  end

  def connection(:down, state) do
    Logger.warn("Connection has been dropped")
    {:ok, state}
  end

  def connection(:terminating, state) do
    Logger.warn("Connection is terminating")
    {:ok, state}
  end

  @impl true
  def subscription(:up, topic, state) do
    Logger.info("Subscribed to #{topic}")
    {:ok, state}
  end

  def subscription({:warn, [requested: req, accepted: qos]}, topic, state) do
    Logger.warn("Subscribed to #{topic}; requested #{req} but got accepted with QoS #{qos}")
    {:ok, state}
  end

  def subscription({:error, reason}, topic, state) do
    Logger.error("Error subscribing to #{topic}; #{inspect(reason)}")
    {:ok, state}
  end

  def subscription(:down, topic, state) do
    Logger.info("Unsubscribed from #{topic}")
    {:ok, state}
  end

  @impl true
  def handle_message(_topic, publish, state) do
    message = Poison.decode!(publish)
    Logger.info("Message Received -> #{publish}")

    device = %{name: message["name"], ip: message["ipAddress"], target: message["target"]}
    Contacts.ContactsController.add_contact(device)

    {:ok, state}
  end

  @impl true
  def terminate(reason, _state) do
    Logger.warn("Client has been terminated with reason: #{inspect(reason)}")
    :ok
  end

end
