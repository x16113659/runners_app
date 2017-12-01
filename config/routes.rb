Rails.application.routes.draw do

  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :orders do 
    resources :orderitems 
  end
  
  devise_for :users do 
    resources :orders 
  end

  get 'cart/index'
  get '/checkout' => 'cart#createOrder'
  get '/orders/pay/:id' => 'orders#confirmPayment'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'

  get '/items/show/:id' => 'items#show'
  get '/items/category/:id' => 'items#categoryfilter'
  get '/items/discount' => 'items#discountfilter'
  post '/items/search' => 'items#search'

  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/remove/:id' => 'cart#remove'

  get '/categories' => 'categories#index'

  root 'static_pages#home'
  root :to => 'site#home'

  resources :categories
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
