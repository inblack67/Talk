defmodule TalkWeb.RoomController do
  use TalkWeb, :controller
  alias Talk.Chat

  def add(conn, params) do
    IO.inspect(params)
    conn
  end

  def get_all(conn, _params), do: conn |> render("data.json", %{data: Chat.list_rooms()})

  def greet(conn, _params) do
    conn |> render("acknowledge.json", %{message: "API up and running"})
  end
end
