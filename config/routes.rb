Rails.application.routes.draw do
  get 'picture_books/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "tops#index"
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resources :users, only: %i[create new destroy edit update show]
  resources :calendars
  resources :picture_books
  resources :posts 
end
