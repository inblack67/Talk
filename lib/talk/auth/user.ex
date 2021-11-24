defmodule Talk.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :password])
    |> validate_required([:name, :username, :email, :password])
    |> validate_length(:name, min: 3, max: 100)
    |> validate_length(:email, min: 5)
    |> validate_length(:username, min: 3, max: 30)
    |> validate_length(:password, min: 8, max: 16)
    |> update_change(:email, &String.downcase/1)
    |> update_change(:username, &String.downcase/1)
    |> unique_constraint([:email, :username])
    |> hash_password
  end

  defp hash_password(%Ecto.Changeset{} = changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password, Argon2.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
