# 2*l*w + 2*w*h + 2*h*l
defmodule Solution do
  def solve() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split("\n")
    |> Enum.reduce([0, 0], fn dimension, [box_area, ribbon_area] ->
      dimension
      |> String.split("x")
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort()
      |> calculate_area()
      |> sum([box_area, ribbon_area])
    end)
    |> IO.inspect()
  end

  # [l, w, h]
  def calculate_area([l, w, h]) do
    [
      2 * l * w + 2 * w * h + 2 * l * h + l * w,
      2 * (l + w) + l * w * h
    ]
  end

  def sum([new_area, new_volume], [total_area, total_volume]) do
    [new_area + total_area, new_volume + total_volume]
  end
end

Solution.solve()
