Rails.application.routes.draw do
  get 'billings/create'
  get 'billings/destroy'
  get 'billings/update'
  get 'costumers/show'
  get 'costumers/index'
  get 'costumers/create'
  get 'costumers/update'
  get 'costumers/destroy'
  get 'pages/home'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
