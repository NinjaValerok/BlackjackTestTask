class GameController < ApplicationController
  before_action :load_game, only: [:show, :hit, :stop]


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

  # little shit, but ok for the start
  def hit
    if @game.player_hand(current_user).score < 20
      @game.hit_user(current_user)
      if @game.player_hand(current_user).score > 21
        @game.update_column(:status, 'Победил Дилер')
        @status = 'Победил Дилер'
        render 'stop', layout: false
      elsif @game.player_hand(current_user).score == 21
        @status = 'У вас блэк джек'
        render 'stop', layout: false
      else
        render 'hit', layout: false
      end
    else
      render js: "alert('Вам хватит ;)')"
    end
  end

  def stop
    @game.play_dealer
    hand = @game.find_winner
    status = hand.try(:type_name)
    case status
    when 'Player'
      @status = 'Победил игрок'
    when 'Dealer'
      @status = 'Победил Дилер'
    else
      @game.push
      @status = 'Пуш'
    end
    puts @status
     render 'stop', layout: false
    @game.update_column(:status, @status)
  end

  private

  def load_game
    @game = Game.find(params[:id])
  end

end
