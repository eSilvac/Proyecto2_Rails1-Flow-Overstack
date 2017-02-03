Rails.application.routes.draw do
    devise_for :users
    get 'questions/index'

	root 'questions#index'

	resources :questions do
		resources :answers, only: [:create,:destroy,:update] do
			resources :votes, only: [:create,:destroy]
			resources :unvotes, only: [:create,:destroy]
			resources :comments, only: [:create,:destroy]
		end
		resources :votes, only: [:create,:destroy]
		resources :unvotes, only: [:create,:destroy]
		resources :comments, only: [:create,:destroy]
		resources :favorites, only: [:create,:destroy]
	end
end
