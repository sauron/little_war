class CarpetController < ApplicationController
  def show
    @computer, @player = Croupier.new.deal

    @score = { computer: 0, player: 0 }

    store_values(@computer, @player, @score)
  end

  def fight
    @computer, @player, @score = load_values

    computer_card = @computer.shift
    player_card = @player.shift

    case
    when computer_card.to_i > player_card.to_i
      flash.now[:alert] = "computer wins"
      @score[:computer] = @score[:computer] + 1
    when computer_card.to_i < player_card.to_i
      flash.now[:alert] = "player wins"
      @score[:player] = @score[:player] + 1
    else
      flash.now[:alert] = "tie"
    end

    store_values(@computer, @player, @score)
    render :show
  end

  private
  def store_values(computer, player, score)
    session[:computer] = computer
    session[:player]   = player
    session[:score]    = score
  end

  def load_values
    [session[:computer], session[:player], session[:score]]
  end
end
