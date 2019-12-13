defmodule ImagexWeb.AuthControllerTest do
  use ImagexWeb.ConnCase

  import Imagex.Factory

  setup [:init]

  defp init(_context) do
    account = insert(:account)
    {:ok, account: account}
  end

  test "POST /auth/register", %{conn: conn} do
    conn =
      post(conn, "/auth/register", %{
        email: "chauhc@buzzmedia.vn",
        password: "secret"
      })

    assert %{"access_token" => token} = json_response(conn, 200)
  end

  test "POST /auth/identity/callback", %{conn: conn, account: account} do
    conn =
      post(conn, "/auth/identity/callback", %{
        email: account.email,
        password: account.password
      })

    assert %{"access_token" => token} = json_response(conn, 200)
  end
end
