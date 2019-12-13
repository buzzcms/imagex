defmodule ImagexWeb.AuthController do
  use ImagexWeb, :controller
  plug Ueberauth

  import Imagex.Auth
  alias ImagexWeb.Helpers

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user = login(auth)
    {:ok, jwt, _full_claims} = Imagex.Auth.Guardian.encode_and_sign(user)
    json(conn, %{access_token: jwt})
  end

  def register(conn, params) do
    case register(params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Imagex.Auth.Guardian.encode_and_sign(user)
        json(conn, %{access_token: jwt})

      {:error, changesets} ->
        json(conn, %{errors: Helpers.error_text(changesets)})
    end
  end
end
