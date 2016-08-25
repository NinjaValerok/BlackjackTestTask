class GameController < ApplicationController
  before_action :load_game, only: [:show, :hit, :stop]

  def start
    @game = Game.create
    @game.create_deck
    dealer = Hand.create(type_name: 'Dealer')
    @game.hands << Hand.create(type_name: 'Player') << dealer
    2.times { dealer.hit }
    redirect_to game_path(@game)
  end

  def hit
    @game.hit
    if @game.player_hand.score > 21
      render 'lose', layout: false
    elsif @game.player_hand.score == 21
      render 'blackjack', layout: false
    else
      render 'hit', layout: false
    end
  end

  def stop
    @game.dealer_hand.play_dealer
    status = @game.find_winner

    case status
    when 'Player'
      render 'win', layout: false
    when 'Dealer'
      render 'lose', layout: false
    else
      @game.push
      render 'push', layout: false
    end
  end

  private

  def load_game
    @game = Game.find(params[:id])
  end

end
