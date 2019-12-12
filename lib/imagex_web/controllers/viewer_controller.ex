defmodule ImagexWeb.ViewerController do
  use ImagexWeb, :controller
  alias Imagex.TransformParser
  alias Imagex.ImaginaryParams

  def index(conn, %{"id" => id, "transform" => transform, "bucket" => _bucket}) do
    %{
      transform_path: _transform_path,
      imaginary_params: %ImaginaryParams{
        action: action,
        params: params
      }
    } = TransformParser.parse_transform(transform)

    # TODO: Use transform_path to check if image is generated

    query = params |> Map.merge(%{"file" => id})

    %{body: body} =
      HTTPoison.get!("http://172.105.123.14:9000/#{action}?#{URI.encode_query(query)}")

    # TODO: Save file & send
    conn |> put_resp_content_type("image/png") |> send_resp(200, body)
  end
end
