defmodule TalkWeb.MessageView do
  use TalkWeb, :view

  def render("acknowledge.json", %{message: message}),
    do: %{success: true, message: message}

  def render("data.json", %{data: data}),
    do: %{success: true, data: data}

  def render("errors.json", %{errors: errors}),
    do: %{success: false, errors: errors}
end
