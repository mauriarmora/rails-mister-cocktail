Rails.application.routes.draw do
  root to: 'pages#home', as: :home
  get '/about', to: 'pages#about', as: :about
  get '/contact', to: 'pages#contact', as: :contact

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:delete]
end
