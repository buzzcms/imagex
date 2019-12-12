defmodule Imagex.ImaginaryParams do
  alias Imagex.ImaginaryParams
  @derive {Jason.Encoder, only: [:action, :params]}

  @default_params %{"extend" => "white"}

  defstruct action: "resize", params: %{}
  use ExConstructor

  @doc """
  Normalize transform path, order by key, use for file system storage
  """
  def to_transform_path(%ImaginaryParams{action: action, params: params}) do
    params_tuple =
      params
      |> Map.to_list()
      |> Enum.map(fn {k, v} ->
        new_k =
          case k do
            "width" -> "w"
            "height" -> "h"
            "extend" -> "b"
            "quality" -> "q"
            _ -> k
          end

        {new_k, v}
      end)

    c =
      case action do
        "resize" -> "scale"
        x -> x
      end

    ([{"c", c}] ++ params_tuple)
    |> Enum.map(&tuple_to_string(&1))
    |> Enum.sort()
    |> Enum.join(",")
  end

  def to_imaginary_params(attrs) do
    case Map.get(attrs, "c") do
      nil -> ImaginaryParams.new(%{params: normalize_params(attrs)})
      action -> ImaginaryParams.new(%{action: action, params: normalize_params(attrs)})
    end
  end

  defp normalize_params(params) do
    params
    |> Map.to_list()
    |> Enum.map(fn {k, v} ->
      new_k =
        case k do
          "w" -> "width"
          "h" -> "height"
          "b" -> "extend"
          "q" -> "quality"
          _ -> nil
        end

      {new_k, v}
    end)
    |> Enum.filter(fn {k, _v} -> !!k end)
    |> Enum.into(@default_params)
  end

  defp tuple_to_string({k, v}) do
    "#{k}_#{v}"
  end
end
