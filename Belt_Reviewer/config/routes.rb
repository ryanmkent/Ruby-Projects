Rails.application.routes.draw do
  get 'comments/create'

  root 'users#login'
 
  post '/users/create'  => 'users#create'

  get 'edit/user/:id' => 'users#edit'

  patch '/update/user/:id' => 'users#update'

  post '/authenticate' => 'users#authenticate'

  get '/logout' => 'users#logout'
  
 ###################################################################################

  get '/events' => 'events#index'

  post '/events/create' => 'events#create'

  get 'events/:id/edit' => 'events#edit'

  patch 'updates/event/:id' => 'events#update'

  delete '/events/:id/delete' => 'events#destroy'

  post 'events/:event_id/join' => 'events#join_event'
  
  get 'events/:id/show' => 'events#show'

  post 'events/:id/comment' => 'events#create_comments'

  delete 'events/:id/cancel_attendance' => 'events#cancel_attendance'

  #############################################################


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
