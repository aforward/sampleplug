defmodule Sampleplug.MessageTest do
  use ExUnit.Case
  alias Sampleplug.Message
  doctest Sampleplug.Message

  test "should support no input" do
    assert Message.hello == "Hello World"
  end

  test "should convert nil to default" do
    assert Message.hello(nil) == "Hello World"
  end

  test "should say your name" do
    assert Message.hello("Andrew") == "Hello Andrew"
  end

  test "should should handle spaces" do
    assert Message.hello("Andrew Forward") == "Hello Andrew Forward"
  end

end