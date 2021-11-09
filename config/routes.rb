Rails.application.routes.draw do
  # get 'imaginnovate/index'

  # get 'imaginnovate/show'

  # get 'imaginnovate/new'

  # get 'imaginnovate/create'

  # get 'imaginnovate/edit'

  # get 'imaginnovate/update'

  # get 'imaginnovate/destroy'
   # root 'users#sign_up'
   root 'imaginnovates#index'
   get 'users/index'
   # controller :users do
   #    get '/users/:id' => :show, as: 'users_show'
   # end
   # resources :users

   devise_for :users
  
  controller :imaginnovates do
    #get 'product/index' => :index, as: 'product_index'
    # post 'create/new' => :new, as: 'imaginnovates_create'
    # get '/imag/:id' => :show, as: 'imaginnovates_show'
    put 'update/:id' => :edit, as: 'imaginnovates_update'
    delete 'delete/:id' => :destroy, as: 'destroy_imaginnovates'
  end
  

  resources :imaginnovates do 
    member do
      get :imaginnovate
    end 
    collection do
      post :new_imaginnovate
    end
    delete 'soft_delete_or_restore' , on: :member
  end
  # The priority is based upon order of creation: first created -> highginnovateest priority.
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
