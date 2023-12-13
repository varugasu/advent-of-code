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
  def calculate_area(dimensions) do
    [
      2 * Enum.at(dimensions, 0) * Enum.at(dimensions, 1) +
        2 * Enum.at(dimensions, 1) * Enum.at(dimensions, 2) +
        2 * Enum.at(dimensions, 0) * Enum.at(dimensions, 2) +
        Enum.reduce(Enum.take(dimensions, 2), &(&1 * &2)),
      Enum.reduce(Enum.take(dimensions, 2), &((&1 + &2) * 2)) +
        Enum.reduce(dimensions, &(&1 * &2))
    ]
  end

  def sum(new_areas, acc) do
    [Enum.at(new_areas, 0) + Enum.at(acc, 0), Enum.at(new_areas, 1) + Enum.at(acc, 1)]
  end
end

Solution.solve()
