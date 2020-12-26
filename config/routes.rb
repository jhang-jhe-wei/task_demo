Rails.application.routes.draw do
  post "tasks/search", to: "tasks#search"
  get "tasks/search", to: "tasks#search"
  get "tasks/order/:type", to: "tasks#index"
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
end
