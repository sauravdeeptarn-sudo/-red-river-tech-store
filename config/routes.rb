Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "products#index"
  resources :products, only: [:index, :show]

  get    "/cart",              to: "cart#show",    as: :cart
  post   "/cart/add/:id",      to: "cart#add",     as: :add_to_cart
  patch  "/cart/update/:id",   to: "cart#update",  as: :update_cart
  delete "/cart/remove/:id",   to: "cart#remove",  as: :remove_from_cart
end