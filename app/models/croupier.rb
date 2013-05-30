class Croupier

  def deal
    deck = Baraja.new.deck

    player_1_cards = deck.sample(20)
    player_2_cards = deck - player_1_cards

    [player_1_cards, player_2_cards]
  end
end
