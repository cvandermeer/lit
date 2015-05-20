Rails.application.routes.draw do
  root to: 'static_pages#home'
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :questions, only: [:show, :new, :create]
  get 'static_pages/pick_category'
  get 'static_pages/pick_language'
end


