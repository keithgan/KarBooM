Rails.application.routes.draw do
  devise_for :officers, controllers: {
    sessions: "officers/sessions",
    passwords: "officers/passwords",
    registrations: "officers/registrations"
  }
  resources :officers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'welcome/index'
  root to: "welcome#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  resources :users
  resource :complaints
	post '/complaints/create', to: 'complaints#create'
  get "/complaints/index", to: 'complaints#index'

end
