Rails.application.routes.draw do
    root 'static_pages#home'

    get 'hello_world', to: 'hello_world#index'

    resources :authentications, only: [:destroy]

    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , registrations: 'registrations'} 

    resources :users do
        resources :groups , only: [:index, :new]
    end
    resources :groups , only: [:show, :edit]

    devise_scope :user do
        root 'devise/sessions#new'
    end
end

