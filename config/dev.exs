use Mix.Config

config :sampleplug, Sampleplug.Repo,[
  adapter: Ecto.Adapters.Postgres,
  database: "sampleplug_#{Mix.env}",
  username: "postgres",
  password: "",
  hostname: "localhost"
]