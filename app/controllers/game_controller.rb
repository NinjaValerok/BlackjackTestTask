class GameController < ApplicationController
  before_action :load_game, only: [:show, :hit]

  def start
    @game = Game.create
    @game.create_deck
    @game.hands << Hand.create(type_name: 'Player') << Hand.create(type_name: 'Dealer')
    redirect_to game_path(@game)
  end

  def hit
    @game.hit
    render 'hit', layout: false
  end

  private

  def load_game
    @game = Game.find(params[:id])
  end

end
