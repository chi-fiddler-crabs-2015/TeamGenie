require 'sidekiq/web'

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'welcome#index'

  resources :teams do
    get '/roster' => 'teams#roster'
    put '/distribute_dues' => 'teams#distribute_dues'
    resources :email_all, only: [:create]
    resources :invitations, only: [:create]
    resources :memberships, except: [:index, :create, :new, :edit, :show, :update] do
      put '/mark_paid' => 'memberships#mark_paid'
      put '/mark_unpaid' => 'memberships#mark_unpaid'
    end
    resources :games do
      resources :rsvps, only: [:update]
    end
  end

  resources :locations, only: [:show, :create]

  resources :users do
    resources :payments, except: [:create, :new, :edit, :destroy] do
      member do
        post :pay
      end
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/send_sms' => 'twilios#create'
  post '/team_text' => 'twilios#team_text'

  mount Sidekiq::Web => '/sidekiq'

# Stripe Connect endpoints
#  - oauth flow
  get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #  - create accounts
  post '/connect/managed' => 'stripe#managed', as: 'stripe_managed'
  post '/connect/standalone' => 'stripe#standalone', as: 'stripe_standalone'

  # Stripe webhooks
  post '/hooks/stripe' => 'hooks#stripe'

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
