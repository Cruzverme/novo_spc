Rails.application.routes.draw do

  get 'costumers/show'
  get 'costumers/index'
  get 'costumers/create'
  get 'costumers/update'
  get 'costumers/destroy'
  get 'billings/create'
  get 'billings/destroy'
  get 'billings/update'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :costumers
  resources :billings
end
