Rails.application.routes.draw do
  get "categories/index"
  get "categories/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }

  root "products#index"
  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create, :show, :index]
  resources :pages, only: [:show]
  resources :payments, only: [:new, :create]

  get  "/about",          to: "pages#about",           as: :about
  get  "/contact",        to: "pages#contact",         as: :contact
  get  "/profile",        to: "customers#profile",     as: :profile
  patch "/profile",       to: "customers#update_profile", as: :update_profile

  get    "/cart",              to: "cart#show",    as: :cart
  post   "/cart/add/:id",      to: "cart#add",     as: :add_to_cart
  patch  "/cart/update/:id",   to: "cart#update",  as: :update_cart
  delete "/cart/remove/:id",   to: "cart#remove",  as: :remove_from_cart
end