defmodule Ui.Mixfile do
  use Mix.Project

  def project do
    [
      app: :contacts,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Main.Application, []},
      extra_applications: [:logger, :runtime_tools, :sqlite_ecto2, :ecto]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.3.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:cowboy, "~> 1.0"},
      {:sqlite_ecto2, "~> 2.2"},
      {:ecto, "~> 2.1"},
      {:tortoise, "~> 0.8.1"},
      {:poison, "~> 3.1"}
    ]
  end
end
