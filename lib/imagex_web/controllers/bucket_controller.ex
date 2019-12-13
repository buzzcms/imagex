defmodule ImagexWeb.BucketController do
  use ImagexWeb, :controller

  import ImagexWeb.Helpers
  alias Imagex.Buckets
  alias Imagex.Schema.Bucket

  def index(conn, _attrs) do
    buckets = Imagex.Buckets.list()
    conn |> json(buckets)
  end

  def create(conn, attrs) do
    case Imagex.Buckets.create(attrs) do
      %Bucket{} = created ->
        conn |> put_status(:created) |> json(created)

      {:error, changesets} ->
        conn |> put_status(:bad_request) |> json(%{errors: error_text(changesets)})
    end
  end

  def update(conn, %{"id" => id, "data" => data}) do
    case Imagex.Buckets.update(id, data) do
      %Bucket{} = updated ->
        conn |> put_status(:created) |> json(updated)

      {:error, changesets} ->
        conn |> put_status(:bad_request) |> json(%{errors: error_text(changesets)})
    end
  end
end
