defmodule Test.MixProject do
  use Mix.Project

  def project do
    [
      app: :test,
      version: "0.2.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_local_path: "plts/test.plt",
        plt_core_path: "plts/core.plt",
        flags: ["-Wno_improper_lists"]
      ],
      # Docs
      name: "Test",
      docs: docs(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:typed_struct, "~> 0.3.0"},
      {:xxhash, "~> 0.3"},
      {:recon, "~> 2.5.4"},
      {:rexbug, ">= 2.0.0-rc1"},
      {:kino, "~> 0.12.2"},
      {:ex_doc, "~> 0.31", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: extras(),
      extra_section: "GUIDES"
    ]
  end

  def extras() do
    []
  end

  def escript do
    [main_module: Test.CLI]
  end
end
