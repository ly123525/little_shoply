Rails.application.routes.draw do

  root "welcomes#index"
  delete '/logout'=> 'sessions#destroy'
  resources :users, :only=>[:new, :create]
  resources :sessions
end
