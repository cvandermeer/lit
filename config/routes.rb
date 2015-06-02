Rails.application.routes.draw do
  get 'word_of_the_week_reactions/new'

  root to: 'static_pages#home'
  
  ### users ###
  devise_for :users, controllers: { registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'user', to: 'users#show', as: 'show_user'
  get '/leaderboard', to: 'users#leaderboard', as: 'leaderboard'
  get '/invites', to: 'users#invites', as: 'invites'
  
  ### questions ###
  get 'questions/new_choose_image', to: 'questions#new_choose_image', as: 'new_choose_image'
  get 'questions/new_write_word', to: 'questions#new_write_word', as: 'new_write_word'  
  resources :questions, except: [:index]
  get 'questions/unchecked_questions', path: '/unchecked_questions'
  get 'questions/:id/submit_answer', to: 'questions#submit_answer', as: 'submit_answer'
  get 'questions/:id/approve_question', to: 'questions#approve_question', as: 'approve'
  get 'questions/:id/show_check', to: 'questions#show_check', as: 'show_check'

  ### static_pages ###
  get 'static_pages/pick_category'
  get 'static_pages/pick_language'

  ### word of the week ###
  resources :word_of_the_weeks, only: [:index, :edit, :update, :show]
  resources :word_of_the_week_reactions

  ### teams ###
  resources :teams do
    resources :memberships, only: [:show, :create, :new]
  end

  get 'memberships/:id/accept_membership', to: 'memberships#accept_membership', as: 'accept_membership'
  get 'memberships/:id/deny_membership', to: 'memberships#deny_membership', as: 'deny_membership'
end

