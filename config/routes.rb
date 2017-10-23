Rails.application.routes.draw do

  root "welcomes#index"
  resources :users, :only=>[:new, :create]
end
