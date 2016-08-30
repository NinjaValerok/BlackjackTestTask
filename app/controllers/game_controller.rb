class GameController < ApplicationController
  before_action :load_game, only: [:show, :hit, :stop]

  layout false, only: [:hit, :stop]


  def index
    @games = Game.all
  end

  def show
    if user_signed_in?
      @game.add_user current_user
    end
  end

  def create
    @game = Game.create
    redirect_to game_path(@game)
  end

  def hit
    @hand = @game.player_hand(current_user)
    @message = @game.hit_user(current_user)
  end

  def stop
    @game.player_hand(current_user).update_column(:status, Hand::STATUS[1])
    @game.stop
    @status = @game.status
  end

  private

  def load_game
    @game = Game.find(params[:id])
  end

end
