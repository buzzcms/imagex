defmodule Imagex.Schema.Bucket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bucket" do
    field :name, :string
    field :secret, :string
    belongs_to :account, Imagex.Schema.Account
    field :created_at, :utc_datetime
    field :modified_at, :utc_datetime
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :secret, :account_id])
    |> validate_required([:name, :secret, :account_id])
    |> unique_constraint(:name)
  end
end
