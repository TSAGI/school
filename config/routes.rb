Rails.application.routes.draw do

  devise_for :teachers, controllers: {registrations: 'teachers/registrations', sessions: 'teachers/sessions'} 
  devise_for :students, controllers: {registrations: 'students/registrations', sessions: 'students/sessions'} 
  
  root "home_page#welcome"
  get 'about' => "home_page#about"
  get 'register' => "home_page#register"
  get 'student_courses' => "courses#student_courses"
  get 'teacher_courses' => "courses#teacher_courses"
  get 'teacher_course' => "courses#teacher_course"

  resources :courses_students

  resources :courses do
    resources :reviews
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
