Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'challenges#index'

  resources :challenges do
    resources :comments
    resources :submissions
  end
  resources :users

  resources :conversations do
    resources :messages
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
end

  get 'mailbox/inbox' => 'mailbox#inbox', :as => :mailbox_inbox
  get 'mailbox/sent' => 'mailbox#sent', :as => :mailbox_sent
  get 'mailbox/trash' => 'mailbox#trash', :as => :mailbox_trash
  get 'user/:user_id/submissions' => 'submissions#index_user', :as => :user_submissions
 

  # get 'user/:id' => 'users#show', :as => :user_show

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
  #     #     resources :sales do
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
