Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'cards#index'

  # main routes

  get '/users/:id/account', to: 'main#account', as: 'user_account'
  get '/payments/success', to: 'payments#success', as: 'payment_success'

  # cards routes

  get '/cards/new', to: 'cards#new', as: 'new_card'
  get '/cards/:id/edit', to: 'cards#edit', as: 'edit_card'
  patch '/cards/:id', to: 'cards#update'
  put '/cards/:id', to: 'cards#update'
  get '/cards/:id', to: 'cards#show', as: 'card'
  post '/cards/:id/checkout', to: 'cards#checkout'
  get '/cards', to: 'cards#index', as: 'cards'
  post '/cards', to: 'cards#create'
  delete '/cards/:id', to: 'cards#destroy'

  # offers routes

  get '/offers/new', to: 'offers#new', as: 'new_offer'
  post '/offers', to: 'offers#create'
  get '/offers', to: 'offers#index', as: 'offers_index'
  get '/offers/:id', to: 'offers#show', as: 'offer'
  get '/offers/:id/edit', to: 'offers#edit', as: 'edit_offer'
  patch '/offers/:id', to: 'offers#update'
  put '/offers/:id', to: 'offers#update'
  delete '/offers/:id', to: 'offers#destroy'
end
