defmodule Vote do
  
  def valid?(name) do
    String.replace(name, "\n", "") in ["Trump", "Hillary", "Bernie"]
  end

  def add(arr, candidate) do
    arr
    |> List.insert_at(0, candidate)
  end
  
  def add(candidate) do
    [] 
    |> List.insert_at(0, candidate)
  end

  def remove(arr, candidate) do
    arr
    |> List.delete(candidate)
  end

  def count(arr, name) do
    arr
    |> Enum.count(&(&1 == name))
  end

  def winner(votes) do
    get_winner(
      count(votes, "Trump"), 
      count(votes, "Hillary"), 
      count(votes, "Bernie")
    )
  end

  def get_winner(trump, hillary, bernie) do
    cond do
      trump > hillary and trump > bernie ->
        "Trump" 
      hillary > trump and hillary > bernie ->
        "Hillary"
      bernie > trump and bernie > hillary ->
        "Bernie"
      true ->
        "Nobody wins :("
    end
  end
end
