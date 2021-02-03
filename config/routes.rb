Rails.application.routes.draw do
  devise_for :users,
   controllers: { registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#top'
  get 'homes/index'
  get 'musics/search'
  #プロフィールページのルーティング
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts do
   resources :musics, only: %i(create)
 end
end
