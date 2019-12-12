defmodule Imagex.TransformParser do
  alias Imagex.ImaginaryParams

  def parse_transform(transform) do
    params =
      transform
      |> String.split(",")
      |> Enum.map(&parse_item(&1))
      |> Enum.filter(&(&1 != nil))
      |> Enum.into(%{})

    imaginary_params = ImaginaryParams.to_imaginary_params(params)
    transform_path = ImaginaryParams.to_transform_path(imaginary_params)

    %{transform_path: transform_path, imaginary_params: imaginary_params}
  end

  defp parse_item(item) do
    case String.split(item, "_") do
      [key, value] -> {key, value}
      _ -> nil
    end
  end
end
