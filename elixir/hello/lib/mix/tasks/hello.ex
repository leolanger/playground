defmodule Mix.Tasks.Hello do
  use Mix.Task

  @shortdoc "Simply runs the Hello.say/0 command"
  def run(_) do
    Mix.Task.run("app.start")
    Hello.say()
  end
end
