Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :users
  resources :products do
    resources :bookings
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


end
