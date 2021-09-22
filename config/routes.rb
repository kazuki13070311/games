Rails.application.routes.draw do
  resources :questions, shallow: true do
    resources :answers, shallow: true do
      resources :reactions
    end
  end
  root 'tops#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  resources :notifications, only: :index

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
