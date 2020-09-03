Rails.application.routes.draw do
  devise_for :users

	root 'pages#home'

	resources :flashcards do
		collection do
			get 'study'
		end
	end

	get "/fetch_card" => 'flashcards#fetch', as: 'fetch_card'
	get "/is_correct" => 'flashcards#is_correct', as: 'is_correct'

	controller :pages do
		get :home
		get :about
		get :contact
	end
end
