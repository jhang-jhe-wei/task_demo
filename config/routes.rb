Rails.application.routes.draw do
  post "sessions/new", to: "sessions#new"
  post "admin/sessions/new", to: "sessions#admin_new"
  get "login", to: "sessions#login"
  get "admin/login", to: "sessions#admin_login"
  delete "session", to: "sessions#destroy"
  post "tasks/search", to: "tasks#search"
  get "tasks/search", to: "tasks#index"
  get "tasks/order/:type", to: "tasks#index"
  resources :tasks
  namespace :admin, path: "1o2rf1n2o321" do
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
end
