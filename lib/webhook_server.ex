defmodule WebhookServer do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/webhook" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    {:ok, data} = Jason.decode(body)
    IO.inspect(data, label: "Received webhook data")
    send_resp(conn, 200, "Webhook received")
  end

  match _ do
    send_resp(conn, 404, "You're lost junior!")
  end
end
