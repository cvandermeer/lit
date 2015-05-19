Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :questions, only: [:show, :new, :create]
end


