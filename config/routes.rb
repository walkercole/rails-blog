Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users
	resources :posts do
		resources :comments
	end
	root "home#index"
	get "/home" => "home#index"
	get "/search" => "users#search"
	get "/sessions/new" => "sessions#new"
	post "/sessions" => "sessions#create"
	delete "/sessions" => "sessions#destroy"
end
