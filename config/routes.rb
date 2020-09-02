Rails.application.routes.draw do
  devise_for :users

	root 'pages#home'

	resources :flashcards do
		collection do
			get 'study'
		end
	end

	controller :pages do
		get :home
		get :about
		get :contact
	end
end
