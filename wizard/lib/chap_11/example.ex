defmodule Wizard.Example do
  def name() do
    ""
  end
  def greeting() do
    IO.inspect("Hello from vsc")
  end

  def greeting(name) do
    IO.inspect("Hello, #{name}")
  end

  def getName() do
    name()
  end

  def setName(input) do
    name = input
  end


end
