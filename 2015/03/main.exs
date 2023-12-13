defmodule Solution do
  def solve do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.graphemes()
    |> solve_puzzles()
  end

  defp solve_puzzles(directions) do
    puzzle_1(directions)
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

  def increment_counter(counter, x, y) do
    Map.put(counter, "(#{x}, #{y})", Map.get(counter, "(#{x}, #{y})", 0) + 1)
  end
end

Solution.solve()
