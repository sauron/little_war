class Croupier

  def deal
    deck = Deck.new.generate

    player_1_cards = deck.sample(20)
    player_2_cards = (deck - player_1_cards).shuffle

    [player_1_cards, player_2_cards]
  end
end
