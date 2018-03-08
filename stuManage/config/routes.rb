Rails.application.routes.draw do
  resources :users
  root 'welcome#index'
    # root 'users#register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
