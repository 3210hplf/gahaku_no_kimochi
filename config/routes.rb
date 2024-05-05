Rails.application.routes.draw do
  root 'staticpages#top'
  resources :questions, only: %i[index new create destroy]
  get 'questions/play', to: 'questions#play', :as => :play
  get 'questions/correct', to: 'questions#correct', :as => :correct
  get 'questions/incorrect', to: 'questions#incorrect', :as => :incorrect
end
