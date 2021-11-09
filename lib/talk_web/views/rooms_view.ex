defmodule TalkWeb.RoomView do
  use TalkWeb, :view

  def render("data.json", %{data: data}),
    do: %{success: true, data: data}

  def render("acknowledge.json", %{message: message}),
    do: %{success: true, message: message}
end
