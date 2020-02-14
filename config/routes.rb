Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'question#index'

  resources :question
  resources :answer, only: [:create, :edit, :update, :show]
  resources :comment, only: [:create, :edit, :update, :show]
  resources :vote, only: [:create]
  resources :tag, only: [:index, :create, :update, :show, :destroy]
  resources :user, only: [:index, :show, :create, :update, :destroy]
  get '/question/answered_questions/:id', to: 'question#answered_questions'
  get '/tag/:id/questions', to: 'tag#get_questions_for_tag'
  get '/tag_question_count', to: 'tag#get_question_count_for_tags'
  get '/answer/question/:id', to: 'answer#show_by_question_id'

  post 'session/authenticate', to: 'session#authenticate'

  post '/vote_data/', to: 'vote#vote_data'
  post '/answer_count/', to: 'answer#count'

  post 'search_tag', to: 'tag#search'
  post 'search_user', to: 'user#search'
  post 'search_question', to: 'question#search'

end
