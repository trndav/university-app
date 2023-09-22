Rails.application.routes.draw do
  root "courses#index"
  get "courses/new", to: "courses#new"

  get "courses", to: "courses#index"
  get "about", to: "pages#about"
  resources :students, except: [:destroy]

  # workaround - not best practice, should be delete "logout"..
  get "logout", to: "logins#destroy"
  get "login", to: "logins#new"
  post "login", to: "logins#create" 
end
