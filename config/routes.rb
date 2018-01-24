Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }, skip: [:sessions]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'register', to: 'users/registrations#new'
    post 'admin', to: 'users/sessions#create', as: :user_session
    get 'admin', to: 'users/sessions#new', as: :new_user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :profiles, :only => [:index]

  get 'authors/:slug', to: 'profiles#show', as: :profile

  root 'application#index'
end
