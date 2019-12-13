defmodule Imagex.Factory do
  use ExMachina.Ecto, repo: Imagex.Repo
  alias Imagex.Schema.{User}

  def account_factory do
    email = sequence(:email, &"user#{&1}")

    %User{
      email: email,
      password: "secret"
    }
  end
end
