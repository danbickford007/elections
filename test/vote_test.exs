
defmodule VoteTests do

  use ExUnit.Case

  doctest Vote

  test "prompt should include one of three names" do
    assert(Vote.valid?("Trump\n"))
  end

  test "adds to the list and returns that list" do
    assert(Vote.add("Trump") == ["Trump"])
  end

  test "adds multiple to list and returns list" do
    list = Vote.add("Trump") 
    |> Vote.add("Bernie") 
    |> Vote.add("Bernie") 
    assert(list == ["Bernie", "Bernie", "Trump"])
  end


  test "removes items for the list" do
    left = ["Trump", "Trump"]
    |> Vote.remove("Trump")

    assert(left == ["Trump"])
  end

  test "count how many votes a candidate has" do
    votes = ["Trump", "Trump", "Trump", "Bernie"]
    assert(Vote.count(votes, "Trump") == 3)
  end

  test "Finds the winner of the candadicy" do
    votes = ["Trump", "Bernie", "Bernie", "Bernie", "Hillary", "Some Dude"]
    assert(Vote.winner(votes) == "Bernie") 
  end

end

