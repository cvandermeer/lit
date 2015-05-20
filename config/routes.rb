Rails.application.routes.draw do
  root to: 'static_pages#home'
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :questions, only: [:show, :new, :create]
  get 'questions/unchecked_questions', path: '/unchecked_questions'
  get 'questions/:id/approve_question' => 'questions#approve_question', as: 'approve'
  get 'questions/:id/submit_answer' => 'questions#submit_answer', as: 'submit_answer'
  get 'static_pages/pick_category'
  get 'static_pages/pick_language'
end


