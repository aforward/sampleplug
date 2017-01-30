defmodule Sampleplug.Message do
  

  @doc ~S"""
  A welcome message, you can provide an optional name otherwise
  get a generic Hello World.

  ## Examples

      iex> Sampleplug.Message.hello
      "Hello World"

      iex> Sampleplug.Message.hello("James")
      "Hello James"
  """
  def hello, do: hello(nil)
  def hello(nil), do: "Hello World"
  def hello(name), do: "Hello #{name}"

end