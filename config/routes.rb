Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/questions', to: 'questions#index'
  resources :questions do 
    collection do
      get 'get_all'
    end
  end

  get '/home', to: 'home#index'
  root to: 'home#index'
end
