Rails.application.routes.draw do
  root to: 'game#index'

  resources :game, only: [:index, :show, :create] do
    post :hit, on: :member
    post :stop, on: :member
  end
end
