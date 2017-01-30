defmodule Sampleplug.Message do
  
  def hello, do: hello(nil)
  def hello(nil), do: "Hello World"
  def hello(name), do: "Hello #{name}"

end