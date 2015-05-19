Rails.application.routes.draw do
  root to: 'static_pages#home'
  devise_for :users, controllers: { registrations: "users/registrations" }
 

end
