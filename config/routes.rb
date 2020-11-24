Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  get '/user_profile' => "users#user_profile"

  get '/' => "menu_boards#home"

  #get 'menu_boards/home'
  get 'home' => 'menu_boards#home'
  root :to => 'menu_boards#home'
  #get 'menu_boards/help'
  get 'help' => 'menu_boards#help'
  #get 'menu_boards/about'
  get 'about' => 'menu_boards#about'
  #get 'menu_boards/pricing'
  get '/pricing' => 'menu_boards#pricing'
  #get 'menu_boards/contact'
  get 'contact' => 'menu_boards#contact'
  #
  post "/mail_contact"  => 'menu_boards#contact_us'
  #
  get "/index"  => 'menu_boards#index'
  #
  get 'signup' => 'users#new'
  #
  get 'login'   => 'sessions#new'
  #
  post 'login'   => 'sessions#create'
  #
  delete 'logout'  => 'sessions#destroy'
  #
  get 'search_page'   => 'users#search'
  #
  get 'dish_edit' => 'dishes#edit'
  #
  post 'dish_new' =>  'dishes#new'
  get  'dish_new' =>  'dishes#new'
  #
  get 'dish_show' => 'dishes#show'
  #
  get 'category_search' => 'users#category_search'

  patch "/dishes/:id" => 'dishes#edit'

  post "category_edit_save" => 'menu_boards#update'

  get 'info_edit'  => 'users#info_edit'

  get 'category_new' =>  'categories#new'
  delete '/categories/:id' => 'categories#destroy'


  resource  :menu
  resources :categories,          only: [:create, :destroy, :edit]
  resources :dishes,              only: [:create, :destroy, :edit]
  resources :relationships,       only: [:create, :destroy]


  #Adding following and followers actions to the Users controller.
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
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
