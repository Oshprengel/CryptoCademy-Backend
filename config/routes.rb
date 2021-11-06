Rails.application.routes.draw do
  #create new user route
  post '/user/create', to: 'users#createUserAttempt'

  #login user route
  get '/user/login' , to: 'users#loginCheck'

  #home page
  get '/', to: 'home#home'

  #to make trades
  post '/trade', to: 'trade#makeTrade'
end
