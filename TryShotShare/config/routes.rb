Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :users, only: [:index, :show]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
  	resources :uploads
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
