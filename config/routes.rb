Rails.application.routes.draw do
  root :to => 'home#index'
  post 'register' => 'home#register'
  post 'login' => 'home#login'
  delete 'quit' => 'home#quit'
  get 'stat' => 'home#stat'
  devise_for :users
end
