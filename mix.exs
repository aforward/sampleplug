defmodule Sampleplug.Mixfile do
  use Mix.Project

  def project do
    [app: :sampleplug,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: applications(Mix.env),
     mod: {Sampleplug, []}]
  end

  defp applications(:dev), do: applications(:all) ++ [:ex_doc, :mix_test_watch]
  defp applications(_), do: [:logger, :cowboy, :plug, :ecto, :postgrex]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev},
      {:mix_test_watch, "~> 0.3", only: [:dev, :test]},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.3"},
      {:ecto, "~> 2.1.3"},
      {:postgrex, ">= 0.13.0"}]
  end
end
