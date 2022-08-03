Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations'}
  resources :users, only: [:show]
  get '/', to: 'colleges#home'
  resources :colleges do
    resources :collreviews, only: [:show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
