Rails.application.routes.draw do
  root 'tops#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
