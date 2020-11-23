defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end

# require OurMacro

quoted =
  quote do
    OurMacro.unless(true, do: "Hi")
  end

# defmodule Logger do
#  defmacro log(msg) do
#    if Application.get_env(:logger, :enabled) do
#      quote do
#        IO.puts("LOgged message: #{unquote(msg)}")
#      end
#    end
#  end
# end

defmodule Example1 do
  #  require Logger

  #  def test do
  #    Logger.log("This is a log message")
  #  end

  defmacro hygienic do
    quote do: val = -1
  end

  defmacro unhygienic do
    quote do: var!(val) = -1
  end
end
