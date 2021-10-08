Rails.application.routes.draw do
  devise_for :users, controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations',
   passwords: 'users/passwords',
  }
  root to: 'home#index'
  resources :contests do
    resources :tasks
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
