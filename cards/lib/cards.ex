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
    ["Ace", "Two", "Three"]
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
end
