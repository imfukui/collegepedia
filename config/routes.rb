Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'colleges#home'
  resources :colleges, only: [:show]
  resources :collreviews, only: [:show, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
