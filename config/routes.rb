Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
  resources :users, except: [:new], as: :user
  resources :categories, except: [:destroy]

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
