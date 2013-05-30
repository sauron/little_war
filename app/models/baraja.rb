class Baraja
  attr_reader :melds, :numbers

  def initialize(total_cards = 10, number_of_melds = 4)
    @total_cards = total_cards
    @number_of_melds = number_of_melds
  end

  def melds
    @melds ||= ("a".."z").to_a[0..(@number_of_melds-1)]
  end

  def numbers
    @numbers ||= (1..@total_cards).to_a
  end

  def deck
     @deck ||= melds.map do |m|
        numbers.collect do |n|
          n.to_s + m
        end
      end.flatten
  end
end
