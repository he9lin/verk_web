defmodule VerkWeb.Mixfile do
  use Mix.Project

  @description """
    A Verk dashboard
  """

  def project do
    [
      app: :verk_web,
      version: "1.5.1",
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: Coverex.Task, coveralls: true],
      name: "Verk Web",
      description: @description,
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {VerkWeb, []},
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:phoenix, "~> 1.5.0"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_html, "~> 2.11"},
      {:gettext, "~> 0.16"},
      {:verk, "~> 1.1"},
      {:plug_cowboy, "~> 2.1"},
      {:plug, "~> 1.7"},
      {:basic_auth, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.13", only: :dev},
      {:coverex, "~> 1.4", only: :test},
      {:meck, "~> 0.8", only: :test},
      {:timex, "~> 3.5"},
      {:jason, "~> 1.1"}
    ]
  end

  defp package do
    [
      maintainers: ["Eduardo Gurgel Pinho", "Alisson Sales"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/edgurgel/verk_web"},
      files: ["lib", "web", "priv", "mix.exs", "README*", "LICENSE*"]
    ]
  end
end
