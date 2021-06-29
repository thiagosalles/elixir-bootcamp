defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Create a new deck as an array of cards.

  ## Examples

      iex> Cards.create_deck()
      ["Ace", "Two", "Three"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Returns the deck with the cards in a new random order

  ## Examples

      iex> Cards.shuffle(["Ace", "Two", "Three"])
      ["Ace", "Three", "Two"]

      iex> Cards.shuffle(["Ace", "Two", "Three"])
      ["Three", "Two", "Ace"]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if a collection cards contains a specific card

  ## Examples

      iex> Cards.contains(["Ace", "Two", "Three"], "Two")
      true

      iex> Cards.contains(["Ace", "Two", "Three"], "Four")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Get a given number of cards from a deck

  ## Examples

      iex> Cards.deal(["Ace", "Two", "Three"], 1)
      {:ok, ["Ace"], ["Two", "Three"]}

      iex> Cards.contains(["Ace", "Two", "Three"], 2)
      {:ok, ["Ace", "Two"], ["Three"]}

      iex> Cards.contains(["Ace", "Two", "Three"], 3)
      {:ok, ["Ace", "Two", "Three"], []}

      iex> Cards.contains(["Ace", "Two", "Three"], 4)
      {:error, "not enough cards"}

  """
  def deal(deck, size) when length(deck) < size do
    {:error, "not enough cards"}
  end

  def deal(deck, size) do
    {hand, new_deck} = Enum.split(deck, size)
    {:ok, hand, new_deck}
  end
end
