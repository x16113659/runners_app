Rails.application.routes.draw do

  devise_for :users

  get 'cart/index'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'

  get '/items/show/:id' => 'items#show'
  get '/items/category/:id' => 'items#categoryfilter'
  post '/items/search' => 'items#search'
  get '/items/discount' => 'items#discountfilter'

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
