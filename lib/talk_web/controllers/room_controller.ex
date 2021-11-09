defmodule TalkWeb.RoomController do
  use TalkWeb, :controller
  alias Talk.Chat
  alias TalkWeb.Utils
  alias TalkWeb.Constants

  def add(conn, params) do
    case Chat.create_room(params) do
      {:ok, _room} ->
        conn |> render("acknowledge.json", %{message: "Room created"})

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("errors.json", %{
          errors:
            changeset
            |> Utils.format_changeset_errors()
        })

      _ ->
        conn
        |> render("errors.json", %{errors: [Constants.internal_server_error()]})
    end
  end

  def get_all(conn, _params) do
    conn
    |> render("data.json", data: Chat.list_rooms())
  end

  def greet(conn, _params) do
    conn |> render("acknowledge.json", %{message: "API up and running"})
  end
end
