Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/console', as: 'rails_admin'
  devise_for :admins

  get 'welcome/index'
  root 'welcome#index'
  #devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'
  # token auth routes available at /api/v1/auth
  #namespace :api, defaults: { format: 'json' } do
  #  scope :v1 do
  #    mount_devise_token_auth_for 'User', at: 'auth'
  #  end
  #end
  mount_devise_token_auth_for 'Coach', at: 'coach_auth'

  mount_devise_token_auth_for 'Company', at: 'company_auth'
  as :company do
    # Define routes for Company within this block.
  end
  as :coach do
    # Define routes for Coach within this block.
    # get 'demo/admins_only', to: 'demo#admins_only'
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
