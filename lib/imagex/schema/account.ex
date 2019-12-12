defmodule Imagex.Schema.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "account" do
    field :username, :string
    field :password, :string
    field :created_at, :utc_datetime
    field :modified_at, :utc_datetime
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
  end
end
