Rails.application.routes.draw do
  devise_for :users,
          #  :controllers => { :registrations => 'registrations' },
           :path => 'accounts',
           :path_names => { :sign_in => 'login',
                            :sign_up => 'signup',
                            :sign_out => 'logout',
                          }
                            # :password => 'secret',
                            # :confirmation => 'verification' }

  root "pages#home"
  resources :articles

  # get "signup", to: "users#new"
  resources :users, except: [:new], as: :user

  # get "login", to: "sessions#new"
  # post "login", to: "sessions#create"
  # delete "logout", to: "sessions#destroy"

  resources :categories, except: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
