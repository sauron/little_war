class CarpetController < ApplicationController
  def show
    @computer, @player = Croupier.new.deal

    @score = { computer: 0, player: 0 }

    store_values(@computer, @player, @score)
  end

  def fight
    @computer, @player, @score = load_values

    if winner = Referee.new.evaluate(@computer.shift, @player.shift)
      @score[winner] += 1
    end

    flash.now[:alert] = winner.present? ? "#{winner.capitalize} wins" : "Tie"
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
