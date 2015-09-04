Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#home'

  get '/index', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/gallery', to: 'galleries#index'
  get '/contact', to: 'contacts#index'

  post '/contact/subscribe', to: 'contacts#create'

  get '/cart', to: 'cart_products#index'

  get '/gallery/add_to_cart/:id', to: 'cart_products#add', as: 'add_to_cart'
  get '/gallery/remove_from_cart/:id', to: 'cart_products#remove', as: 'remove_from_cart'
  get '/gallery/empty_cart', to: 'cart_products#empty_cart', as: 'empty_cart'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' 

  get '/checkout/payment', to: 'checkouts#payment'
  post '/checkout/payment', to: 'checkouts#payment_provider' 

  resource :stripe
  resources :paypal


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
