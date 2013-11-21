RailsExamples::Application.routes.draw do
  if Rails.env.development?
    mount UserMailView => 'user_mail_view'
  end

  scope module: :web do
    get "/404", :to => "web/errors#not_found"
    get "/500", :to => "web/errors#internal_server_error"

    post '/auth/developer/callback' => 'social_networks#facebook'
    get '/auth/:action/failure' => 'social_networks#failure'

    root 'welcome#index'

    resource :session, only: [:new, :create, :destroy]
    resource :password
    resources :users, only: [:index, :show, :new, :create] do
      member do
        #NOTE get потому что из письма
        get :confirm
      end
      scope module: :users do
        resources :topics, only: [:index]
      end
    end
    resources :hubs, only: [:index]
    resources :topics

    namespace :account do

    end
  end

  namespace :api do
    namespace :v1 do
      resources :hubs
      resources :topics do
        scope module: :topics do
          resources :comments
        end
      end
    end
  end
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
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
