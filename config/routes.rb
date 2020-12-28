Rails.application.routes.draw do
  devise_for :users,
   controllers: {registrations: 'users/registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#top'
  get 'homes/index'
  #プロフィールページのルーティング
  get '/users/:id', to: 'users#show', as: 'user'
end
