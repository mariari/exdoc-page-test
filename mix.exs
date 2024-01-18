defmodule Foo.MixProject do
  use Mix.Project

  def project do
    [
      app: :foo,
      version: "0.5.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_local_path: "plts/foo.plt",
        plt_core_path: "plts/core.plt",
        flags: ["-Wno_improper_lists"]
      ],
      # Docs
      name: "Foo",
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
      extra_section: "GUIDES",
      before_closing_body_tag: &docs_before_closing_body_tag/1
    ]
  end

  def extras() do
    []
  end

  def escript do
    [main_module: Foo.CLI]
  end

  defp docs_before_closing_body_tag(:html) do
    # https://hexdocs.pm/ex_doc/readme.html#extensions
    """
    <script src="https://cdn.jsdelivr.net/npm/mermaid@10.7.0/dist/mermaid.min.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
    mermaid.initialize({
      startOnLoad: false,
      theme: document.body.className.includes("dark") ? "dark" : "default"
    });
    let id = 0;
    for (const codeEl of document.querySelectorAll("pre code.mermaid")) {
      const preEl = codeEl.parentElement;
      const graphDefinition = codeEl.textContent;
      const graphEl = document.createElement("div");
      const graphId = "mermaid-graph-" + id++;
      mermaid.render(graphId, graphDefinition).then(({svg, bindFunctions}) => {
        graphEl.innerHTML = svg;
        bindFunctions?.(graphEl);
        preEl.insertAdjacentElement("afterend", graphEl);
        preEl.remove();
      });
    }
    });
    </script>
    """
  end
  defp docs_before_closing_body_tag(_), do: ""
end
