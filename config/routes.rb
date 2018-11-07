Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do 
    collection do
      get 'get_all'
    end
  end

  get '/home', to: 'home#index'

  get '/quizzes/new', to: 'quizzes#new'
  get '/quizzes/:id/doQuiz', to: 'quizzes#do_quiz', as: 'do_quiz'
  post '/quizzes/create', to: 'quizzes#create'
  post '/quizzes/:id/submitQuiz', to: 'quizzes#submit_quiz', as: 'submit_quiz'

  root to: 'home#index'
end
