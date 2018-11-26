Rails.application.routes.draw do
  devise_for :officers, controllers: {
    sessions: "officers/sessions",
    passwords: "officers/passwords",
    registrations: "officers/registrations"
  }
  resources :officers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post 'welcome/numplate', to: 'welcome#numplate'
  
  get "/complaints_tab", to: 'officers#complaints_tab'
  get "/appeals_tab", to: 'officers#appeals_tab'
  get "/fines_tab", to: 'officers#fines_tab'

  get 'welcome/index'
  root to: "welcome#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  resources :users

  get "/users/:id/edit" , to: "users/registrations#edit", as: "edit_user_details"
  get "/complaints/index", to: 'complaints#index'
  get "/complaint_history", to: 'complaints#complaint_history'

  resources :complaints do
    post "/carousel_approve", to: 'complaints#carousel_approve'
    post "/carousel_reject", to: 'complaints#carousel_reject'
    post "/reject", to: "complaints#reject", as: 'reject'
    resources :fines
  end
  
  get "/complaints/:id" , to: "complaints#show", as: "show_complaint"
  
  post '/complaints/create', to: 'complaints#create'
  
  get "/complaints", to: 'complaints#index'

  get "/fines", to: "fines#index", as: "all_fines"
  get "/fines/:id" , to: "fines#show", as: "show_fine"

  get '/fines/:id/braintree/new', to: 'braintree#new', as: 'new_braintree_payment'
  post '/fines/:id/braintree/checkout', to: 'braintree#checkout', as: 'fine_amount_braintree_checkout'
  post '/fines/:id/appeal', to: 'fines#appeal', as: "appeal"



end
