Rails.application.routes.draw do
  get '/', to: 'colleges#home'
  resources :colleges, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
