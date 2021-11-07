defmodule TalkWeb.RoomView do
  use TalkWeb, :view

  def render("acknowledge.json", %{message: message}),
    do: %{success: true, message: message}
end
