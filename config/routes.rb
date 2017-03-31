Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resource :groups, only: [:new, :edit]
end
