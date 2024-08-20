defmodule Solution do
  def solve do
    IO.puts("Puzzle 1: #{mine("yzbqklnj", 0, 5)}")
    IO.puts("Puzzle 2: #{mine("yzbqklnj", 0, 6)}")
  end

  def mine(input, index, zeros_count) do
    if :crypto.hash(:md5, input <> Integer.to_string(index))
       |> Base.encode16()
       |> String.slice(0, zeros_count) ==
         String.duplicate("0", zeros_count) do
      index
    else
      mine(input, index + 1, zeros_count)
    end
  end
end

Solution.solve()
