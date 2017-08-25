Rails.application.routes.draw do


  get 'reservations/your_reservation'

  get 'reservations/your_rent'

  get 'gadgets/index'

  get 'gadgets/show'

  get 'gadgets/update'

  get 'gadgets/new'

  get 'gadgets/create'

  get 'users/show'

  get 'users/index'

  root 'pages#home'
  get 'dashboard' => 'dashboards#index'

  resources :users, only: [:index, :show]
  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  # only dev
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
