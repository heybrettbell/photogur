Rails.application.routes.draw do
  get 'sessions/new'=> 'sessions#new'
  post 'sessions' => 'sessions#create'


  get 'user/new'
  get 'user/create'
  resources :users, only: %i(create new)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id/edit' => 'pictures#edit'
  patch 'pictures/:id' => "pictures#update"

  get 'pictures/:id' => 'pictures#show'

  delete 'pictures/:id' => 'pictures#destroy'
end
