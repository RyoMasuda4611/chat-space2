Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :groups do
    resources :messages, only: [:create]
    collection do
      get  :ajax_user_list
    end
    member do
      get :ajax_add_users
    end
  end
  resources :messages, exept: [:create]
end
