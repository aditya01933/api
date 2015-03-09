Rails.application.routes.draw do
  resources :user_data

  resources :weighings

  mount RailsAdmin::Engine => '/console', as: 'rails_admin'
  devise_for :admins
  root 'welcome#index'

  mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Coach', at: 'coach_auth'
  mount_devise_token_auth_for 'Company', at: 'company_auth'
  # token auth routes available at /api/v1/auth
  #namespace :api, defaults: { format: 'json' } do
  #  scope :v1 do
  #    mount_devise_token_auth_for 'User', at: 'auth'
  #  end
  #end

  as :user do
    #get 'demo/admins_only', to: 'demo#admins_only'
  end

  as :company do
    # Define routes for Company within this block.
  end
  as :coach do
    # Define routes for Coach within this block.
    # get 'demo/admins_only', to: 'demo#admins_only'
  end


end
