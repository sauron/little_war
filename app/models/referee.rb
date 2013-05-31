class Referee

  def evaluate(computer_card, player_card)
    winner = nil
    winner = :computer if computer_card.to_i > player_card.to_i
    winner = :player   if computer_card.to_i < player_card.to_i

    winner
  end
end
