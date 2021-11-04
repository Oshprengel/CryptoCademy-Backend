Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
  post '/user/createuser', to: 'users#createUserAttempt'

  post '/user/login' , to: 'users#loginCheck'
end
