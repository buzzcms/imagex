defmodule ImagexWeb.ViewerController do
  use ImagexWeb, :controller
  import Imagex.TransformParser

  def index(conn, %{"id" => id, "transform" => unordered_transform, "bucket" => bucket}) do
    map = to_map(unordered_transform)
    transform = to_transform(map)
    request_url = to_request_url(%{map: map, id: id, bucket: bucket})

    IO.inspect(%{
      map: map,
      transform: transform,
      request_url: request_url
    })

    %{body: body} = HTTPoison.get!(request_url)

    # TODO: Save file & send
    conn |> put_resp_content_type("image/png") |> send_resp(200, body)
  end
end
