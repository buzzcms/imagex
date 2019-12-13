defmodule Imagex.Auth do
  use Ecto.Schema

  import Ecto.Query, only: [from: 2]
  alias Ueberauth.Auth
  alias Imagex.Repo
  alias Imagex.Schema.User

  def register(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def login(%Auth{provider: :identity} = auth) do
    user = %{
      email: auth.info.email,
      password: password_from_auth(auth)
    }

    login_with_email(user)
  end

  def login_with_email(%{email: email, password: password}) do
    query = from u in User, where: u.email == ^email and u.password == ^password
    Repo.one(query)
  end

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  defp password_from_auth(auth) do
    auth.credentials.other.password
  end
end
