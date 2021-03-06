defmodule Cards do
  @moduledoc """
    Provides method for creating and handling a deck of cards
  """

  @doc """
    Creates a new deck as an array of cards.

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Spades", "Two of Spades", "Three of Spades", ...]

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
    Checks if a collection of cards contains a specific card

  ## Examples

      iex> Cards.contains?(["Ace", "Two", "Three"], "Two")
      true

      iex> Cards.contains?(["Ace", "Two", "Three"], "Four")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Gets a given number of cards from a deck

  ## Examples

      iex> Cards.deal(["Ace", "Two", "Three"], 2)
      {:ok, ["Ace", "Two"], ["Three"]}

      iex> deck = Cards.create_deck()
      iex> {:ok, hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  Decks with not enough cards return an error:

      iex> Cards.deal(["Ace", "Two", "Three"], 4)
      {:error, "not enough cards"}]

  """
  def deal(deck, size) when length(deck) < size do
    {:error, "not enough cards"}
  end

  def deal(deck, size) do
    {hand, new_deck} = Enum.split(deck, size)
    {:ok, hand, new_deck}
  end

  @doc """
    Saves the deck to the file system

  ## Examples

      iex> Cards.save(["Ace", "Two", "Three"], "deck1")
      :ok

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck from the file system

  ## Examples

      iex> Cards.load("deck1")
      ["Ace", "Two", "Three"]

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file does not exist"
    end
  end

  @doc """
    Creates a deck, shuffle it and deal a given number of cards

  ## Examples

      iex> Cards.create_hand(1)
      {:ok, ["Two"], ["Ace", "Three"]}

      iex> {:ok, hand, deck} = Cards.create_hand(1)
      iex> hand
      ["Five of Hearts"]

  """
  def create_hand(size) do
    create_deck()
    |> shuffle()
    |> deal(size)
  end
end
