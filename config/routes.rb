Rails.application.routes.draw do
  resources :game, only: [:index, :show] do
    post :hit, on: :member
    post :enough, on: :member
    post :start, on: :collection
  end
end
