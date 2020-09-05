Rails.application.routes.draw do
  resources :cards
  devise_for :users

	resources :decks do
		collection do
			get "/:id/study" => 'decks#study', as: 'study'
		end
	end

	root 'pages#home'

	resources :flashcards do
		collection do
			get 'study'
			get 'is_correct'
		end
	end

	get "/fetch_card" => 'flashcards#fetch', as: 'fetch_card'

	controller :pages do
		get :home
		get :about
		get :contact
	end
end
