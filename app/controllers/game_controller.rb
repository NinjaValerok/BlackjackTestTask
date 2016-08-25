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
    if @game.player_hand.score < 20 && !@game.stand?
      @game.hit
      if @game.player_hand.score > 21
        @status = 'Победил Дилер'
        render 'stop', layout: false
      elsif @game.player_hand.score == 21
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
    @game.update_column(:stand, true)
    @game.dealer_hand.play_dealer
    status = @game.find_winner

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
  end

  private

  def load_game
    @game = Game.find(params[:id])
  end

end
