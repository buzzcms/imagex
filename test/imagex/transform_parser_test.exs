cases = %{
  "w_100" => "b_white,c_scale,w_100",
  "w_100,q_80" => "b_white,c_scale,q_80,w_100",
  "w_100,q_80,c_scale" => "b_white,c_scale,q_80,w_100",
  "q_80,w_100" => "b_white,c_scale,q_80,w_100",
  "c_fit,q_80,w_100" => "b_white,c_fit,q_80,w_100",
  "c_fit,q_80,w_100,b_black" => "b_black,c_fit,q_80,w_100",
  "c_fit,c_scale,q_80,w_100,b_black" => "b_black,c_scale,q_80,w_100",
  "c_scale,c_fit,q_80,w_100,b_black" => "b_black,c_fit,q_80,w_100"
}

defmodule Imagex.ImaginaryParamsTest do
  use Imagex.DataCase
  alias Imagex.TransformParser

  describe "Normalize transform path" do
    Enum.each(cases, fn {input, expected_output} ->
      test "#{input}" do
        assert %{transform_path: transform_path} = TransformParser.parse_transform(unquote(input))
        assert transform_path == unquote(expected_output)
      end
    end)
  end

  describe "Parse imaginary request" do
    assert %{
             imaginary_params: %Imagex.ImaginaryParams{
               action: "fit",
               params: %{"extend" => "black", "quality" => "80", "width" => "100"}
             }
           } = TransformParser.parse_transform("c_scale,c_fit,q_80,w_100,b_black")
  end
end
