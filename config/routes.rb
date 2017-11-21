Rails.application.routes.draw do
  get 'cart/index'
  get 'site/about'
  
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/admin' => 'user#admin_login'
  get '/logout' => 'user#logout'

  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clear'
  get '/cart/:id' => 'cart#add'

  root 'static_pages#home'

  resources :categories
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
