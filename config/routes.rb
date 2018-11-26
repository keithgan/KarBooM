Rails.application.routes.draw do
  devise_for :officers, controllers: {
    sessions: "officers/sessions",
    passwords: "officers/passwords",
    registrations: "officers/registrations"
  }
  resources :officers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/complaints_tab", to: 'officers#complaints_tab'
  get "/appeals_tab", to: 'officers#appeals_tab'

  get 'welcome/index'
  root to: "welcome#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  resources :users

  get "/users/:id/edit" , to: "users/registrations#edit", as: "edit_user_details"
  
  resources :complaints do
    resources :fines
  end
    
  get "/officers/:officer_id/complaints/:id" , to: "complaints#show", as: "show_complaint"

	# post '/complaints/create', to: 'complaints#create'
  get "/complaints/index", to: 'complaints#index'

end
