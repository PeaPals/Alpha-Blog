Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users,
            :controllers => {
              sessions: 'users/sessions',
              registrations: 'users/registrations'
            },
          #  :controllers => { :registrations => 'registrations' },
           :path => 'accounts',
           :path_names => { :sign_in => 'login',
                            :sign_up => 'signup',
                            :sign_out => 'logout',
                          }
                            # :password => 'secret',
                            # :confirmation => 'verification' }

  get '/member-data', to: 'members#show'

  root "pages#home"

  resources :articles
  resources :users, except: [:new, :edit, :update], as: :user
  resources :categories, only: [:show, :index]

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  delete '/delete-account', to: "users#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
