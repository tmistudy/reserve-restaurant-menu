Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/home' ,to: 'restaurants#home'
  get '/restaurants/search' ,to: 'restaurants#search'
  get '/restaurants/:id' ,to: 'restaurants#show'
  post '/reservation' ,to: 'reservations#reservation'
  get '/reservation/confirm' ,to: 'reservations#confirm'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
