Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  ### users ###
  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'user', to: 'users#show', as: 'show_user'
  get '/leaderboard', to: 'users#leaderboard', as: 'leaderboard'
  
  ### questions ###
  resources :questions, only: [:show, :new, :create]
  get 'questions/unchecked_questions', path: '/unchecked_questions'
  get 'questions/:id/submit_answer', to: 'questions#submit_answer', as: 'submit_answer'
  get 'questions/:id/approve_question', to: 'questions#approve_question', as: 'approve'
  
  ### static_pages ###
  get 'static_pages/pick_category'
  get 'static_pages/pick_language'
end

