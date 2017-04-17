Rails.application.routes.draw do
  root 'dashboard#index'

  get 'orders' => 'order#get_order'
  post 'add-order' => 'order#create'

  get 'menu' => 'shop_menu#get_menu'
end
