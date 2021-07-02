defmodule CardsTest do
  use ExUnit.Case, async: true
  doctest Cards, except: [
    create_deck: 0,
    create_hand: 1,
    shuffle: 1,
    deal: 2
  ]
end
