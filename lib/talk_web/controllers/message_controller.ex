defmodule TalkWeb.MessageController do
  use TalkWeb, :controller
  alias Talk.Chat
  alias TalkWeb.Constants

  def get_all(conn, %{"id" => id}) do
    conn
    |> render("data.json", data: Chat.list_messages_by_room(id))
  end

  def get_all(conn, _params) do
    conn
    |> render("errors.json", errors: [Constants.not_authorized()])
  end

  def greet(conn, _params) do
    conn
    |> render("acknowledge.json", %{message: "API up and running"})
  end
end
