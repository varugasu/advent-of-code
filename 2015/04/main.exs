defmodule Solution do
  def solve do
    IO.puts("Puzzle 1: #{mine_puzzle_1("yzbqklnj", 0)}")
  end

  def mine_puzzle_1(input, index) do
    if :crypto.hash(:md5, input <> Integer.to_string(index))
       |> Base.encode16()
       |> String.slice(0, 5) ==
         "00000" do
      index
    else
      mine_puzzle_1(input, index + 1)
    end
  end
end

Solution.solve()
