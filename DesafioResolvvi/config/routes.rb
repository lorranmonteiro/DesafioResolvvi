Rails.application.routes.draw do

  resources :lawyers
  resources :states
  root "clients#index"

  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
