defmodule Imagex.Schema.Bucket do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Jason.Encoder,
    only: [:id, :name, :secret, :created_at, :modified_at]
  }

  schema "bucket" do
    field :name, :string
    field :secret, :string
    belongs_to :user, Imagex.Schema.User
    field :created_at, :naive_datetime
    field :modified_at, :naive_datetime
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :secret, :user_id])
    |> validate_required([:name, :secret, :user_id])
    |> unique_constraint(:name)
  end

  def update_changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :secret, :user_id])
    |> unique_constraint(:name)
  end
end
