Rails.application.routes.draw do

  namespace :admin do
    resources :items
  end
  
  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
  end

  devise_for :admins

  namespace :admin do
    resources :order_details
    # get 'order_details/index'
    # get 'order_details/show'
    # get 'order_details/edit'
  end

  root to: 'admin/order_details#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
