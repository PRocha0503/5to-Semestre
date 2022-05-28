
# Intro: Pablo Rocha, learning concurency in elixir

defmodule Concurrency do
  defp welcome(name),do: IO.puts "Hello #{name}"

  defp count(name,0),do: IO.puts "Lift off #{name}!!"
  defp count(name,n) do
    IO.puts "#{name}: #{n}"
    count(name,n-1)
  end
  defp sum(_n,limit) do
    Enum.sum(1..limit)
  end

  def main do
    IO.puts "MAIN THREAD START"
  # Set up a concurreny thread
    ["Pablo","Pablo1","Pablo2","Pablo3"]
    |> Enum.map(&Task.start(fn-> count(&1,10) end))
    IO.puts "MAIN THREAD END"
  end

  def multi_sum(limit,threads) do
    #Task async to ger the end value
    1..threads
    |>Enum.map(&Task.async(fn-> sum(&1,limit)end))
    |>IO.inspect()
    |>Enum.map(&Task.await(&1))
    |>IO.inspect()
    |>Enum.sum()
    |>IO.inspect()

  end

  def timer(function) do
    function
    |>:timer.tc()
    |>elem(0)
    |>Kernel./(1_000_000)
    |>IO.inspect()
  end

end

# Concurrency.main()
# Concurrency.multi_sum(100,3)
Concurrency.timer(fn->Concurrency.multi_sum(100,3)end)
