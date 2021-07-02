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

  describe "deal/2" do
    test "works if deck has enough cards" do
      deck = Cards.create_deck()
      hand_size = 5

      assert {:ok, hand, rest_of_deck} = Cards.deal(deck, hand_size)
      assert length(hand) == hand_size
      assert length(rest_of_deck) == length(deck) - hand_size
    end

    test "fails if deck has not enough cards" do
      deck = Cards.create_deck()

      assert {:error, _reason} = Cards.deal(deck, 500)
    end
  end
end
