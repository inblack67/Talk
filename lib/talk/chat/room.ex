defmodule Talk.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias Talk.Chat.Message

  @derive {Jason.Encoder, except: [:__meta__, :messages]}
  schema "rooms" do
    field :description, :string
    field :name, :string

    has_many(:messages, Message)

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :description])
    |> unique_constraint(:name)
    |> validate_required([:name, :description])
    |> validate_length(:name, min: 5, max: 20)
    |> validate_length(:description, min: 15, max: 300)
    |> update_change(:name, &String.downcase(&1))
  end
end
