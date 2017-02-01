defmodule Sampleplug.Web do  
  use Plug.Router
  require Logger
  require EEx

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
    |> Plug.Conn.put_resp_content_type("text/html") 
    |> Plug.Conn.send_resp(200, layout(&template_homepage/1, %{head_title: "Homepage", h1: "Hello World"}))
  end

  post "/" do
    conn = parse(conn)
    conn 
    |> Plug.Conn.put_resp_content_type("text/html") 
    |> Plug.Conn.send_resp(200, layout(&template_homepage/1, %{head_title: "Homepage", h1: conn.params["newH1"]}))
  end


  get "/hello/:name" do
    view = %{head_title: "Hello #{name}", name: name}
    conn 
    |> Plug.Conn.put_resp_content_type("text/html") 
    |> Plug.Conn.send_resp(200, layout(&template_hello/1, view))
  end

  match _ do  
    conn
    |> send_resp(404, "This isn't the page you are looking for")
  end 


  # TODO: make it work with Plug.Parsers
  # plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  def parse(conn, opts \\ []) do
    opts = Keyword.put_new(opts, :parsers, [Plug.Parsers.URLENCODED, Plug.Parsers.MULTIPART])
    Plug.Parsers.call(conn, Plug.Parsers.init(opts))
  end  

  EEx.function_from_file :def, :layout, "lib/templates/layout.eex", [:templatefn, :view]
  EEx.function_from_file :def, :template_homepage, "lib/templates/homepage.eex", [:view]
  EEx.function_from_file :def, :template_hello, "lib/templates/hello.eex", [:view]
  EEx.function_from_file :def, :template_nav, "lib/templates/nav.eex", [:view]

end 