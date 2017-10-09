Rails.application.routes.draw do

  root 'pages#home'
  get 'dashboard' => 'dashboards#index'

  resources :gadgets, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'location'
      get 'preload'
      get 'preview'
      get 'features'
      get 'requirements'
    end
    resources :reservations, only: [:create, :accept_reservation]
    resources :photos, only: [:create, :destroy]
  end

  get '/your_rents' => 'reservations#your_rents'
  get '/your_reservations' => 'reservations#your_reservations'

  resources :guest_reviews, only: [:create, :destroy]
  resources :owner_reviews, only: [:create, :destroy]

  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve' => "reservations#approve"
      post '/decline' => "reservations#decline"
    end
  end

  resources :users, only: [:index, :show]

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  # only dev
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get 'notifications/index'

end
