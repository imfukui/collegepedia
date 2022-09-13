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

  get '/', to: 'colleges#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  resources :colleges, only: [:index, :show] do
    resources :collreviews, only: [:new, :create]
    resources :lessons, only: [:index, :new, :create, :show, :edit, :update] do
      resources :course_reviews, only: [:new, :create]
    end
  end

  resources :course_reviews, only: [:edit, :update, :destroy]

  resources :collreviews, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
