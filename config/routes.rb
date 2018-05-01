Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home/index'

  scope module: 'users' do
    devise_for :users, skip: :registrations
  end

  resources :users

end
