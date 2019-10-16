Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'costumers#index'
  get 'costumer_informations', to: 'costumers#costumer_informations'

  resources :costumers
  resources :billings
end
