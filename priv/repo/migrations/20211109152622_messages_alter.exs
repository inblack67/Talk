defmodule Talk.Repo.Migrations.MessagesAlter do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add(:content, :string, null: false)
      add(:room_id, references(:rooms, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(index(:messages, [:room_id]))
  end
end
