Rails.application.routes.draw do
  get 'panopen_courses/list_courses'
  get 'panopen_courses/list_course_students'
  get 'panopen_courses/update_user'

  post "panopen_courses/update_user_name"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "panopen_courses#list_courses"
end
