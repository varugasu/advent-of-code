defmodule Solution do
  def solve do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.graphemes()
    |> solve_puzzles()
  end

  defp solve_puzzles(directions) do
    puzzle_2(directions)
  end

  def puzzle_1(directions) do
    directions
    |> Enum.reduce(
      %{x: 0, y: 0, counter: %{"(0, 0)": 1}},
      fn direction, %{x: x, y: y, counter: counter} ->
        case direction do
          "^" -> %{x: x, y: y + 1, counter: increment_counter(counter, x, y + 1)}
          ">" -> %{x: x + 1, y: y, counter: increment_counter(counter, x + 1, y)}
          "v" -> %{x: x, y: y - 1, counter: increment_counter(counter, x, y - 1)}
          "<" -> %{x: x - 1, y: y, counter: increment_counter(counter, x - 1, y)}
        end
      end
    )
    |> Map.get(:counter)
    |> map_size()
    |> IO.inspect()
  end

  def puzzle_2(directions) do
    directions
    |> Stream.with_index()
    |> Enum.reduce(
      %{
        santa: %{x: 0, y: 0, houses: ["(0, 0)"]},
        robot: %{x: 0, y: 0, houses: ["(0, 0)"]}
      },
      fn {direction, index}, %{santa: santa, robot: robot} ->
        if rem(index, 2) == 0 do
          %{santa: move(santa, direction), robot: robot}
        else
          %{santa: santa, robot: move(robot, direction)}
        end
      end
    )
    |> Map.values()
    |> Enum.flat_map(& &1.houses)
    |> Enum.uniq()
    |> Enum.count()
    |> IO.inspect()
  end

  defp move(%{x: x, y: y, houses: houses}, direction) do
    case direction do
      "^" -> %{x: x, y: y + 1, houses: Enum.concat(houses, ["(#{x}, #{y + 1})"])}
      ">" -> %{x: x + 1, y: y, houses: Enum.concat(houses, ["(#{x + 1}, #{y})"])}
      "v" -> %{x: x, y: y - 1, houses: Enum.concat(houses, ["(#{x}, #{y - 1})"])}
      "<" -> %{x: x - 1, y: y, houses: Enum.concat(houses, ["(#{x - 1}, #{y})"])}
    end
  end

  def increment_counter(counter, x, y) do
    Map.put(counter, "(#{x}, #{y})", Map.get(counter, "(#{x}, #{y})", 0) + 1)
  end
end

Solution.solve()
