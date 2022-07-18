Rails.application.routes.draw do
  resources :bookings
  get 'home/index'
  devise_for :users

  # resources :bookings do
  #   collection do
  #     post 'update_booking'
  #   end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_scope :user do
    authenticated :user do
      root 'bookings#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
