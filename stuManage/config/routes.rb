Rails.application.routes.draw do
  resources :s_classes
  resources :grades
  get "login" => 'session#new'
  post "login" => 'session#login'
  get "logout" => 'session#logout'

  resources :users
  root 'welcome#index'
    # root 'users#register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
