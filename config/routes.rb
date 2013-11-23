Kutang::Application.routes.draw do


  resources :models


  resources :orders, only: [:show, :create, :update]

  resources :line_items, only: [:create, :update]

  resources :reset_passwords do
    put "update"
  end

  resources :contacts, only: [:new, :show, :create]

  resources :subcategories, only: [:index, :show]

  resources :locations, only: [:index, :show] do
    resources :adverts

  end

  namespace :admin do
    resources :categories, :sections, :users, :adverts, :unapproved_adverts, :locations, :contacts, :makes
    resources :subcategories, except: [:new]
    resources :models
    resources :orders, only: [:index, :show, :destroy]
    resources :categories do
      resources :subcategories
    end
  end

  resources :categories, only: [:index, :show] do
    resources :adverts
  end

  resources :subcategories, only: [:index] do
    resources :adverts
  end


  resources :sections
  resources :adverts

  resources :users



  match 'admin' => 'admin/users#index', :as => :admin

  controller :sections do
    get 'all_categories'
    get 'search_by_price'
  end

  controller :categories do
    get "search_by_price"
    get "search_by_years"
    get "search_by_kilometers"
  end

  controller :session do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'logout' => :destroy
  end

  controller :pages do
    get "privacy_policy"
    get "program_policy"
    get "terms_of_use"
    get "about"
    get "user_safety"
    get "help"
    get 'thanks'
    get 'show'
  end

  controller :users do
    get "mykutangaza"
    get "pending_ads"
    get "onhold_ads"
    get "expired_ads"

    get "promote_my_ads"
    get "my_profile"
    get "my_order"
    get "change_password"
    post "new_password"
    get "search_my_ads"
    get 'forgot_password'
    get "search_user"

  end

  controller :adverts do
    get "repost"
    get "poster_othersads"
    get "email_to_poster"
    get "delete_adverts"
    get "larger_image"
  end

  resources :adverts do
    get 'order_reference', on: :member
  end



  root :to => 'sections#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
