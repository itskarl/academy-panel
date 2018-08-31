Rails.application.routes.draw do
  root 'pages#index'

  get 'pages/index'
  get 'pages/help'
  get 'pages/about'

  resources :users
  resources :students
  resources :courses do
   resources :cohorts
  end
  resources :instructors
  resources :cohorts


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # get 'cohorts/edit'
  # get 'cohorts/index'
  # get 'cohorts/new'
  # get 'cohorts/show'
  # get 'courses/edit'
  # get 'courses/index'
  # get 'courses/new'
  # get 'courses/show'
  # get 'instructors/edit'
  # get 'instructors/index'
  # get 'instructors/new'
  # get 'instructors/show'
  # get 'students/edit'
  # get 'students/index'
  # get 'students/new'
  # get 'students/show'
  # get 'users/edit'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
