Rails.application.routes.draw do
  resources :myths_users
  resources :myths
  resources :user_conversations
  resources :conversations
  resources :organizations_provinces
  resources :powers
  resources :regions
  resources :recipients
  resources :messages
  resources :posts
  resources :users
  resources :congregations
  resources :populations
  resources :relationships
  resources :attitudes
  resources :organizations
  resources :artifacts
  resources :races
  resources :actors
  resources :deities
  resources :associations
  resources :borders
  resources :domains
  resources :terrains
  resources :provinces

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #does this route do anything? 
  get '/maps' => 'maps#main'
  get '/maps/shade' => 'maps#shade'

  #and is this one redundant due to resources?
  put '/deities/:id/update' => 'deities#update'

  #for ajax response requests
  get '/posts/:id/respond' => 'posts#respond'
  #for ajax topic creation
  get '/posts/:id/newtopic' => 'posts#new_topic'
  #for ajax map report requests
  get '/provinces/:id/report' => 'provinces#report'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'deities#index'

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
