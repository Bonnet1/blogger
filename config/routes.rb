Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do
    resource :comments
  end
  resources :tags
end
