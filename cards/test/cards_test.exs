defmodule CardsTest do
  use ExUnit.Case, async: true
  doctest Cards, except: [
    create_deck: 0,
    create_hand: 1,
    shuffle: 1,
    deal: 2
  ]

  describe "create_deck/1" do
    test "makes 20 cards" do
      deck = Cards.create_deck()
      assert length(deck) == 20
    end
  end

  describe "shuffle/1" do
    test "randomize the deck" do
      deck = Cards.create_deck()
      shuffled = Cards.shuffle(deck)
      assert shuffled != deck
    end
  end
end
