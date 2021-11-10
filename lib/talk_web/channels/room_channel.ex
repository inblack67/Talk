defmodule TalkWeb.RoomChannel do
  use TalkWeb, :channel
  alias Talk.Chat

  @new_message "new_message"

  def join("room:" <> room_id, _payload, socket) do
    IO.inspect("joining channel")
    {:ok, %{messages: Chat.list_messages_by_room(room_id)}, assign(socket, :room_id, room_id)}
  end

  def handle_in("new_message", %{"payload" => %{"content" => content}}, socket) do
    res = Chat.create_message(%{room_id: socket.assigns.room_id, content: content})

    case res do
      {:ok, new_message} ->
        IO.inspect("broadcasting new message....")
        broadcast!(socket, @new_message, %{data: new_message})
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = _changeset} ->
        {:noreply, socket}

      _ ->
        {:noreply, socket}
    end
  end

  def handle_in("new_message", payload, socket) do
    IO.inspect("payload done")
    IO.inspect(payload)
    {:noreply, socket}
  end
end
