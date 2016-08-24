class GameController < ApplicationController
  def index
  end

  def new
    @game = Game.create
    @game.hands << Hand.create << Dealer_hand.create
  end

  def create
  end
end
