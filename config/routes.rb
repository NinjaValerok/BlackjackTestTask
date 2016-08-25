Rails.application.routes.draw do
  root to: 'game#index'

  resources :game, only: [:index, :show] do
    post :hit, on: :member
    post :stop, on: :member
    post :start, on: :collection
  end
end
