defmodule Imagex.Buckets do
  alias Imagex.Repo
  alias Imagex.Schema.Bucket

  def list do
    entities = Repo.all(Bucket)
    %{entities: entities}
  end

  def create(attrs) do
    case Repo.insert(%Bucket{} |> Bucket.changeset(attrs)) do
      {:ok, %{id: id}} -> Repo.get!(Bucket, id)
      {:error, changesets} -> {:error, changesets}
    end
  end

  def update(id, data) do
    changesets = Repo.get!(Bucket, id) |> Bucket.update_changeset(data)

    case Repo.update(changesets) do
      {:ok, _} ->
        Repo.get!(Bucket, id)

      {:error, changesets} ->
        {:error, changesets}
    end
  end
end
