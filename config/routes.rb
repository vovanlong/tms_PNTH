Rails.application.routes.draw do
  root "static_pages#home"
  resources :courses do
    member do
      resources :subjects
    end
  end
  resources :subjects
end
