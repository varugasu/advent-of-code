defmodule Solution do
  def solve() do
    {:ok, contents} = File.read("input.txt")

    result =
      contents
      |> String.graphemes()
      |> Enum.reduce([0, 1, 0], fn x, [current_floor, index, basement_index] ->
        case x do
          "(" ->
            [
              current_floor + 1,
              index + 1,
              set_basement_index(current_floor + 1, index, basement_index)
            ]

          ")" ->
            [
              current_floor - 1,
              index + 1,
              set_basement_index(current_floor - 1, index, basement_index)
            ]
        end
      end)

    IO.inspect(result)
  end

  def set_basement_index(current_floor, index, basement_index) do
    if basement_index == 0 && current_floor == -1 do
      index
    else
      basement_index
    end
  end
end

Solution.solve()
