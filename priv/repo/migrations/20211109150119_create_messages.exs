defmodule Talk.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string, null: false
      add :room_id, null: false, references(:rooms, on_delete: :delete_all)

      timestamps()
    end

    create index(:messages, [:room_id])
  end
end
