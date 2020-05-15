Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/cocktails')
  get 'cocktails/search', to: 'cocktails#search', as: :search
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: :create
  end
  resources :doses, only: :destroy
end
