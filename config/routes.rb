Rails.application.routes.draw do
    devise_for :users
    get 'questions/index'

	root 'questions#index'

	resources :questions do
		resources :votes, only: [:create,:destroy]
		resources :unvotes, only: [:create,:destroy]
		resources :comments, only: [:create,:destroy]
	end
end
