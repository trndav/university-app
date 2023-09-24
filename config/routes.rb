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

  # Route-path for student enroll course
  # Changed post to get, bc post did not return page
  get "course_enroll", to: "student_courses#create"

  # Trying, link to courses in students view do not work. This requires show in courses_controller.
  resources :courses
end
