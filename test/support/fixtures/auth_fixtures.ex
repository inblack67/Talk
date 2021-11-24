defmodule Talk.AuthFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Talk.Auth` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        password: "some password",
        username: "some username"
      })
      |> Talk.Auth.create_user()

    user
  end
end
