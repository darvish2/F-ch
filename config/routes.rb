Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	devise_for :users


	devise_scope :user do
		get '/users/sign_out' => 'devise/sessions#destroy'
	end




	resources :topics
	resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "user/postuser" => "user#postuser"

  get 'top' => 'homes#top'

  root "user#postuser"

  post 'topics/create' => 'topics#create'

  post 'posts/create' => 'post#create', as: :post_create

  


  resources :user




end
