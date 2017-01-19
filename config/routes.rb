Rails.application.routes.draw do
    devise_for :users
    get 'questions/index'

	root 'questions#index'

	resources :questions
end
