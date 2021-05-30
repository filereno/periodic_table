Rails.application.routes.draw do
  get 'element/index'
  root to: "welcome#index"
  resources :table, only: %i[index show]
end
