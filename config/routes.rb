Rails.application.routes.draw do
  root 'groups#index'
  
  resources :groups, param: :name do
    resources :jobs, param: :name
  end
end
