defmodule Imagex.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :password, :string
    field :created_at, :utc_datetime
    field :modified_at, :utc_datetime
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
  end
end
