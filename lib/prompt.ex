defmodule Prompt do

  def main(args) do 
    hello()
  end

  def hello do
    IO.gets "Which presidential canidate are you going to vote for?"
  end

end
