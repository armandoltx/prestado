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

  get '/category/:category_id' => 'products#index_category', as: 'category_index' # 'category_index' is the helper


  get 'search' => 'products#search', as: 'search' # 'search' is the helper
  get 'search_results' => 'products#search_results', as: 'search_results'




end
