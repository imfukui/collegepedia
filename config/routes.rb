Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'colleges#home'
  resources :colleges do
    resources :collreviews, only: [:show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
