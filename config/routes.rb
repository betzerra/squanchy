require 'telegram/bot'

Rails.application.routes.draw do
  controller :posts do
    get '/posts/random' => :random
    get '/posts/random/:tag' => :random_tagged
  end

  resources :tags
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  telegram_webhook TelegramController
end
