Rails.application.routes.draw do
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


  resources :weighings, :only => [:index,  :create, :update, :destroy, :show]
  resources :user_data, :only => [:create, :update, :show]
  resources :diets,     :only => [:index,  :create, :update, :destroy, :show]
  resources :programs,  :only => [:index,  :create, :update, :destroy, :show]
  resources :measurements
  resources :groups
  resources :scales
  resources :families
  resources :devices
  resources :activity_levels
  resources :activity_types
  as :company do
    # Define routes for Company within this block.
  end
  as :coach do
    # Define routes for Coach within this block.
    # get 'demo/admins_only', to: 'demo#admins_only'
  end


end
