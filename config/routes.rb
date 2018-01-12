Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise_ghost/registrations',
    sessions: 'devise_ghost/sessions'

  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'register', to: 'devise_ghost/registrations#new'
    get 'admin', to: 'devise_ghost/sessions#new'
  end
  root 'application#index'
end
