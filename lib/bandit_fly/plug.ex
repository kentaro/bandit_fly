defmodule BanditFly.Plug do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, "Hello, Fly.io!")
  end

  match _ do
    send_resp(conn, 404, "404 Not Found")
  end
end
