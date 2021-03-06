Blog::Application.routes.draw do

  match 'categories/:id' => "categories#show"
  match 'reviews/get_dishes' => "reviews#getDishes"
  match 'reviews/new' => 'reviews#new', :as => :new_review
  match 'restaurants/add' => 'restaurants#add', :as => :new_restaurant
  
  devise_scope :user do
    get 'logout', :to => 'devise/sessions#destroy'
    get 'login', :to => 'devise/sessions#new'
  end
  
  resources :dishes do
    resources :reviews
  end

  resources :categories do
    resources :restaurnants
  end


  resources :users
  resources :categories
# devise_scope :user do match '/users', :to => 'users#omniauth_callbacks'  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
 
  resources :restaurants do
    resources :reviews
    resources :dishes
  end
  

  
  
  root :to => "home#index"
  
  match '/contact', :to => 'pages#contact'
   match '/about',   :to => 'pages#about'
   match '/help',    :to => 'pages#help'
  get "home/index"
  devise_scope :user do
  get '/users/auth/facebook' => 'users/omniauth_callbacks#passthru'
  
  match 'restaurants/:id/vote' => 'reviews#vote', :as => :review_vote
end
 # root :to => "home#index"
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.




end
