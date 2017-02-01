defmodule Sampleplug.Web do  
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http(
      Sampleplug.Web, 
      [],
      [port: Application.get_env(:sampleplug, :port)])
  end

  get "/" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World")
  end

  match _ do  
    conn
    |> send_resp(404, "This isn't the page you are looking for")
  end 

end 