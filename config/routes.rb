Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise_ghost/registrations',
  }, skip: [:sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'register', to: 'devise_ghost/registrations#new'
    post 'admin', to: 'devise_ghost/sessions#create', as: :user_session
    get 'admin', to: 'devise_ghost/sessions#new', as: :new_user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root 'application#index'
end
