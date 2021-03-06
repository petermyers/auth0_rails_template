Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :health, to: 'health#health'
  get :me, to: 'me#me'
  get 'messages/public', to: 'message#public'
  get 'messages/protected', to: 'message#protected'

  resources :users, only: [:create]
end
