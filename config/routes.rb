Rails.application.routes.draw do
  root 'pages#home'
  get '/pages/home', to: 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'user/registrations'
  }

end
