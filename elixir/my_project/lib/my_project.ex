# sart
defmodule Greeter do
  def hello(name) do
    "Hello, " <> name
  end
end

Greeter.hello("Sean") |> IO.puts()

defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end

IO.puts(Length.of([]))
IO.puts(Length.of([1, 2, 3]))

defmodule Greeter1 do
  def hello(%{name: person_name}) do
    IO.puts("Hello, " <> person_name)
  end
end

fred = %{name: "Fred", age: "95", favorite_color: "Taupe"}
Greeter1.hello(fred)

defmodule Greeter2 do
  def hello(%{name: person_name} = person1) do
    IO.puts("Hello, " <> person_name)
    IO.inspect(person1)
  end
end

Greeter2.hello(fred)

defmodule Greeter3 do
  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    pharse() <> name
  end

  defp pharse, do: "Hello, "
end

Greeter3.hello(["Sean", "Steve"]) |> IO.puts()
