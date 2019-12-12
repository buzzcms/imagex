defmodule Imagex.TransformParser do
  @allow_actions ["scale", "fit"]
  @allow_widths ["100", "200", "400"]
  @allow_heights ["100", "200", "400"]
  @allow_qualities ["60", "80", "90", "100"]
  @allow_backgrounds ["black", "white"]

  def to_map(transform) do
    transform
    |> String.split(",")
    |> Enum.reduce([], fn item, acc ->
      case String.split(item, "_") do
        ["c", v] when v in @allow_actions -> acc ++ [{"action", v}]
        ["w", v] when v in @allow_widths -> acc ++ [{"width", v}]
        ["h", v] when v in @allow_heights -> acc ++ [{"height", v}]
        ["b", v] when v in @allow_backgrounds -> acc ++ [{"extend", v}]
        ["q", v] when v in @allow_qualities -> acc ++ [{"quality", v}]
        _ -> acc
      end
    end)
    |> Enum.into(%{"extend" => "white", "action" => "scale"})
  end

  def to_transform(map) do
    map
    |> Enum.reduce([], fn item, acc ->
      case item do
        {"action", v} -> acc ++ ["c_#{v}"]
        {"width", v} -> acc ++ ["w_#{v}"]
        {"height", v} -> acc ++ ["h_#{v}"]
        {"extend", v} -> acc ++ ["b_#{v}"]
        {"quality", v} -> acc ++ ["q_#{v}"]
        _ -> acc
      end
    end)
    |> Enum.sort()
    |> Enum.join(",")
  end

  def to_request_url(%{map: map, bucket: bucket, id: id}) do
    action =
      case Map.get(map, "action") do
        "scale" -> "resize"
        v -> v
      end

    query = Map.drop(map, ["action"]) |> Map.merge(%{"file" => Path.join(bucket, id)})
    "/#{action}?#{URI.encode_query(query)}"
  end
end
