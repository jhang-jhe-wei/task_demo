Rails.application.routes.draw do
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  get "tasks/order/:type", to: "tasks#index"
end
