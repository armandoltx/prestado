Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :users
  resources :products do
  resources :bookings
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
                                # name of the folder in view # name of the file in the view
  get '/products_for/:gender' => 'products#index_gender'

  get '/category/:category_id' => 'products#index_category', as: 'category_index' # 'category_index' is the helper

#  post '/bookings/:id/success' => 'bookings#success', as: 'booking_success' WE DO NOT NEED IT ANYMORE, WE ARE REDIRECTING TO THE SAME PAGE BUT CREATING AN IF STATEMENT IN THE FORM, SO I DELETED THE SUCCESS VIEW IN THE BOOKINGS FOLDER

  post '/products/:product_id/bookings/:id' => 'bookings#show'
  #Using this url to redirect to the same page when people submit the payment form
  # We can have the same route with different verbs, rails will get the right verb deppending on the action.

        # name of the folder in view # name of the file in the view
  get 'search' => 'products#search', as: 'search' # 'search' is the helper
  get 'search_results' => 'products#search_results', as: 'search_results'




end
