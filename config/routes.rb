Rails.application.routes.draw do
  root "static_pages#home"
  resources :courses do
    resources :subjects
  end
  resources :subjects
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
end
