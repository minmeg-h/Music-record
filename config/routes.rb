Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#top'
  get 'homes/index'
  get 'homes/search'
  #プロフィールページのルーティング
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create index show destroy)
end
