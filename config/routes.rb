Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/post/hashtag/:name' => 'posts#hashtag'
  get '/post/hashtag' => 'posts#hashtag'

  get 'posts/:post_id/likes' => 'likes#create'
  get 'posts/:post_id/likes/:id' => 'likes#destroy'

  

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get :toppage
    end
  end
root 'posts#toppage'


resources :maps, only: [:index]

end
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articlesy"

