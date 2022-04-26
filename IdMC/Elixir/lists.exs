
# Intro: Pablo Rocha, funciones de listas

defmodule Tlists do
  @moduledoc """
  Funciones para lisas
  """
  @doc """
  Sum all numbers in a lost
  """
  def sum(list) do
    if list == [] do
      0
    else
      hd(list) + sum(tl(list))
    end
  end
  def recSum(list,a) do
    if list == [] do
      a
    else
      recSum(tl(list),hd(list)+a)
    end
  end
  # Exp: with pattern matching
  def patSum(list), do: do_sum(list,0)
  defp do_sum([],result), do: result
  defp do_sum(list,result), do: do_sum(tl(list),result + hd(list))

  # Exp: with better pattern matching
  def patSum2(list), do: do_sum2(list,0)
  defp do_sum2([],result), do: result
  defp do_sum2([head|tail],result), do: do_sum(tail,result + head)

  def positives(list), do: do_positives(list, [])
  defp do_positives([],result), do: Enum.reverse(result)
  defp do_positives([head | tail],result) do
    if head > 0 do
      do_positives(tail, [head | result])
    else
      do_positives(tail, result)
    end
  end
end

IO.puts (Tlists.sum([2,3,4,5]))
IO.puts (Tlists.recSum([2,3,4,5],0))
IO.puts (Tlists.patSum([2,3,4,5]))
IO.puts (Tlists.patSum2([2,3,4,5]))

#! No se pueden imprimir listas en Racket
IO.puts (Tlists.positives([2,-3,-4,5]))
