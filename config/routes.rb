Rails.application.routes.draw do
  root to: "static_pages#top" # /でstatic_pagesのtopアクションを表示
  resources :purchase, only: %i[new create index show edit update destroy]
  resources :users, only: %i[new create]
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  resources :products, only: %i[new create index show edit update destroy]
  post "guest_login", to: "guest_sessions#create"
end
