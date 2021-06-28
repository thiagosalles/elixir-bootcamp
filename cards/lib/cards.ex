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

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
end
