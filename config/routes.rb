Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create], defaults: { format: 'json' }
  resources :sessions, only: %i[create], defaults: { format: 'json' }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :writers, only: %i[index show]
    end
  end
end
