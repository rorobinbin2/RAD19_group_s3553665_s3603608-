Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/addcourse',  to: 'courses#new'
  post  '/addcourse',  to: 'courses#create'
  get   '/addcategory', to: 'categories#new'
  post  '/addcategory', to: 'categories#create'
  get   '/addlocation', to: 'locations#new'
  post  '/addlocation', to: 'locations#create'

  
  resources :users
  resources :courses
  resources :categories
  resources :locations
end