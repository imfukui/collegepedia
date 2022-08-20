Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions',
    passwords: 'user/passwords',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
  resources :users, only: [:show]
  get '/', to: 'homes#index'
  resources :colleges do
    resources :collreviews, only: [:show, :new, :create]
  end
  resources :collreviews, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
