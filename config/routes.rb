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
  resources :exercise_categories do
    resources :tasks
  end
  resources :users do
  end
  get 'about_us', to: 'about_us#index'
  get 'leaderboard', to: 'leaderboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
