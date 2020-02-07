Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'question#index'

  resources :question
  get '/question/answered_questions/:id', to: 'question#answered_questions'

  get '/user', to: 'user#index'
  get '/user/:id', to: 'user#show'

  get '/tag', to: 'tag#index'
  get '/tag/:id', to: 'tag#show'
  get '/tag/:id/questions', to: 'tag#get_questions_for_tag'
  get '/answer/question/:id', to: 'answer#show_by_question_id'
  resources :answer, only: [:create, :edit, :update, :show]
  resources :comment, only: [:create, :edit, :update, :show]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
