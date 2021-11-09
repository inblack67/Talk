defmodule TalkWeb.MessageController do
  use TalkWeb, :controller
  alias Talk.Chat
  alias TalkWeb.Utils
  alias TalkWeb.Constants

  def add(conn, %{"content" => content, "id" => id}) do
    case Chat.create_message(%{room_id: id, content: content}) do
      {:ok, _room} ->
        conn |> render("acknowledge.json", %{message: "Message created"})

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

  def add(conn, _params) do
    conn
    |> render("errors.json", errors: [Constants.not_authorized()])
  end

  def get_all(conn, %{"id" => id}) do
    conn
    |> render("data.json", data: Chat.list_messages_by_room(id))
  end

  def get_all(conn, _params) do
    conn
    |> render("errors.json", errors: [Constants.not_authorized()])
  end

  def greet(conn, _params) do
    conn |> render("acknowledge.json", %{message: "API up and running"})
  end
end
