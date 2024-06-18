Rails.application.routes.draw do
  root 'staticpages#top'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :questions, only: %i[index new create destroy]
  get 'questions/play', to: 'questions#play', :as => :play
  get 'questions/answer', to: 'questions#answer', :as => :answer
  get 'questions/correct', to: 'questions#correct', :as => :correct
  get 'questions/incorrect', to: 'questions#incorrect', :as => :incorrect
  resources :shiritori_games, only: %i[new create index show] do
    resources :drawings, only: %i[new create index edit update], shallow: true
  end
end
