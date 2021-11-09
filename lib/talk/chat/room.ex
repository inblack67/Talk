defmodule Talk.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset
  require Protocol

  @derive {Jason.Encoder, except: [:__meta__]}
  schema "rooms" do
    field :description, :string
    field :name, :string

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
