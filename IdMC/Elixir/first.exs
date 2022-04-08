# First function in elixir

defmodule Learn do
  def factHide(x) do
    factTail(x,1)
  end
  def factTail(x,a) do
    if x == 0 do
      a
    else
      factTail(x - 1 ,x * a)
    end
  end
end

IO.puts Learn.factHide(5)
