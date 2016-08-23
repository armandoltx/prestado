Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :users
  resources :products do
    resources :bookings
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/products_for/:gender' => 'products#index_gender'

  get 'search' => 'products#search', as: 'search'
  get 'search_results' => 'products#search_results', as: 'search_results'




end
