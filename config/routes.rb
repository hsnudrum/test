Rightpeopleforthejob::Application.routes.draw do

  resources :partners

  resources :teams

  resources :testscaffolds

  resources :filter_analytics

  resources :contact_feewises

  resources :bulletins

  resources :discount_codes

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :us

  resources :subscriptions

  resources :purchase_preferences

  resources :accounts

  resources :cards

  # devise_for :users, :controllers => {:registrations => "registrations"}
  # devise_for :users
  devise_for :users, :controllers  => { :registrations => 'my_devise/registrations' }

  mount Split::Dashboard, :at => 'split'


  get "static_pages/create"

  get "static_pages/support"
  get "static_pages/purchase"
  get "static_pages/partners"
  get "static_pages/investors"
  get "static_pages/careers"

  get "static_pages/why_feewise"
  get "static_pages/terms_of_use"
  get "static_pages/sign_up"
  get "static_pages/sign_in"
  get "static_pages/forgot"

  get "static_pages/privacy_policy"
  get "static_pages/how_it_works"
  get "static_pages/about_us"
  get "static_pages/thank_you"
  get "static_pages/equal_housing_opportunity"

  get "static_pages/team"
  get "homes/home_a"
  get "homes/home_b"


  get "static_pages/run_restart"

  # get "static_pages/F123"

  resources :static_pages
  resources :agents

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
  # root :to => "static_pages#index"

  authenticated :user do
    # root :to => 'static_pages#private_home'
    # root :to => 'agents#index'
    # root :to => 'purchase_preferences#show'
    # root :to => 'accounts#show'
    root :to => 'static_pages#index'
  end
  root :to => 'static_pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  match ':action' => 'static_pages#:action'

end
