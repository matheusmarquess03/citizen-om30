require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'citizens#index'
  resources :citizens
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'search_form', :as => 'citizen_search_form', to: 'citizens#search_form'
  mount Sidekiq::Web => '/sidekiq'
end
