Rails.application.routes.draw do

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'
  get 'mainpages'=>'main_pages#home'

  root  'main_pages#home'
  get   'contact' => 'main_pages#contact'
  get   'signup'  => 'customers#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'addproduct' => 'products#new'
  get  'editproduct' => 'products#edit'

  resources :customers
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
