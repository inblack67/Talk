defmodule TalkWeb.RoomController do
  use TalkWeb, :controller

  def get_all(conn, _params) do
    conn |> render("acknowledge.json", %{message: "API up and running"})
  end
end
