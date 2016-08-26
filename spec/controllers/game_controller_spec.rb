require 'rails_helper'

RSpec.describe GameController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "populates an array of games" do
      game = Game.create
      get :index
      assigns(:games).should eq([game])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "POST #create" do
    subject { post :create }

    it "redirects to game_url(@game)" do
      expect(subject).to redirect_to(game_url(assigns(:game)))
    end
  end

end
