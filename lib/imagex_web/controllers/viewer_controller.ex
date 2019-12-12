defmodule ImagexWeb.ViewerController do
  use ImagexWeb, :controller
  alias Imagex.TransformParser

  def index(conn, %{"id" => id, "transform" => transform, "bucket" => bucket}) do
    transform = TransformParser.parse_transform(transform)

    json(conn, %{
      id: id,
      bucket: bucket,
      transform: transform
    })
  end
end
