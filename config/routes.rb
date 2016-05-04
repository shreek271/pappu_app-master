Rails.application.routes.draw do

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
end
