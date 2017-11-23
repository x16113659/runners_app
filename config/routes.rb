Rails.application.routes.draw do
  devise_for :users
  get 'cart/index'
  get 'site/about'
  
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/admin' => 'user#admin_login'
  get '/logout' => 'user#logout'

  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/remove/:id' => 'cart#remove'

  root 'static_pages#home'
  root :to => 'site#home'

  resources :categories
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
