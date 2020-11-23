defmodule Examples do
  defstruct fisrst: nil, last: nil

  # @type t(first, last) :: %Examples{first: first, last: last}

  # @type t :: %Examples{first: integer, last: integer}

  # @spec sum_times(integer, Examples.t()) :: integer
  # @spec sum_times(integer, Examples.t(integer, integer)) :: integer
  def sum_times(a, params) do
    for i <- params.first..params.last do
      i
    end
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
    |> round
  end
end

defmodule Product do
  @spec sum_product(integer) :: integer
  def sum_product(a) do
    [1, 2, 3]
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
  end
end
