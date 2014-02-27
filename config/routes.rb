Coursify::Application.routes.draw do
  if Rails.env.development?
    #NOTE проверка писем
    mount UserMailView => 'user_mail_view'
  end

  namespace :api do
    constraints SubdomainConstraint do
      scope module: :companies, as: 'company' do
        resources :courses, only: [] do
          scope module: :courses do
            resources :reviews, only: [] do
              member do
                patch :fire_event
              end
            end
          end
          member do
            patch :fire_event
          end
        end
        resources :teachers, only: [:create] do
          member do
            patch :fire_event
          end
        end
        resources :users, only: [] do
          collection do
            get :autocomplete
          end
        end
        resources :mailing_lists, only: [] do
          member do
            patch :fire_event
          end
        end
        resources :courses, only: [] do
          scope module: :courses do
            resources :members
          end
        end
        resources :lessons, only: [] do
          scope module: :lessons do
            resources :attendants, only: [:index, :create] do
              collection do
                delete :remove
              end
            end
          end
        end
        resources :pages, only: [] do
          collection do
            post :reorder
          end
        end
      end
    end
  end

  scope module: :web do
    get '/auth/:action/callback' => 'social_networks#facebook'
    get '/auth/:action/failure' => 'social_networks#failure'

    resource :locale, only: [:update]

    #NOTE work with subdomains
    scope module: 'companies', as: 'company' do
      constraints SubdomainConstraint do
        root to: "welcome#index"
        resources :courses, only: [:show] do
          collection  do
            get :finished
            get :nearest
          end
          scope module: :courses do
            resources :reviews, only: [:new, :create, :index]
            resource :member, only: [:create, :destroy]
          end
        end

        resources :reviews, only: [:index]
        resources :teachers, only: [:index, :show]
        resources :news, only: [:index, :show]
        resources :pages, only: [:show]
        resource :schedule, only: [:show]

        namespace :admin do

          root to: "welcome#index"

          resource :profile, only: [:edit, :update]
          resources :courses, only: [:index, :show]
          resources :lessons, only: [:index, :destroy] do
            scope module: :lessons do
              resources :attendants, only: :index
            end
          end
          resources :offline_courses, only: [:show, :new, :edit, :update, :create]
          resources :online_courses, only: [:show, :new, :edit, :update, :create]
          resources :reviews, only: [:index, :show, :edit, :update]
          resources :members, only: [:index, :new, :create]
          resources :teachers, only: [:index, :edit, :update]
          resources :managers
          resources :pages
          resources :news
          resources :mailing_lists
        end
      end
    end

    root to: "welcome#index"

    namespace :account do
      root to: 'welcome#index'
      resource :profile, only: [:edit, :update]
      resource :password, only: [:edit, :update]
      resources :companies, only: [:index, :new, :create]
      resources :courses
      resources :teach_companies, only: [:index]
    end

    resources :companies, only: [:index]
    resources :courses, only: [:index]
    resources :pages do
      collection do
        get :tour
      end
    end

    resource :password, only: [:edit, :update]
    resource :session, only: [:new, :create, :destroy]
    resource :remind_password, only: [:new, :create]
    resources :users, only: [:show, :new, :create] do
      member do
        get :confirm
      end
    end

    namespace :admin do
      root to: "welcome#index"

      resources :users
    end
  end
end
