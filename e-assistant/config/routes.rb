Rails.application.routes.draw do

  resources :events
  post '/logout' => 'users#logout'
  get 'users/:id/edit_form' => 'users#edit_form'
  get 'calendar/index'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/login' => 'users#login'
  post 'home/create' => 'home#create'
  get 'home/new' => 'home#new'
  get 'home/login' => 'home#login'
  get '/users/:id' => 'users#show'
  get '/' => 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
