Rails.application.routes.draw do
  
  get 'categories/index'

  get 'categories/show'

  get 'categories/edit'

  get 'categories/new'

  get 'categories/destroy'

  get 'answers/index'

  get 'answers/show'

  get 'answers/edit'

  get 'answers/new'

  get 'answers/destroy'

  get 'questions/index'

  get 'questions/show'

  get 'questions/edit'

  get 'questions/new'

  get 'questions/destroy'

  get 'products/index'

  get 'products/show'

  get 'products/edit'

  get 'products/new'

  get 'products/destroy'

  get 'bids/index'

  get 'bids/show'

  get 'bids/edit'

  get 'bids/new'

  get 'bids/destroy'

  get 'contacto/index'

  get 'paginas_estaticas/sobre_nosotros'

  get 'paginas_estaticas/como_funciona'

  get 'welcome/index'

  get 'users/index'

  get 'users/new'

  get 'users/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
