Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end

  authenticated :user do
    root 'pages#authenticated', to: 'pages#authenticated', as: :authenticated_root
  end

  root 'pages#home'
end
