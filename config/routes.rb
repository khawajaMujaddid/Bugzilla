Rails.application.routes.draw do
  get 'bugzilla_help', to: 'bugzilla#help'
  devise_for :users
  resources :bugs, only: [:new, :create, :update, :index, :edit]
  get 'user_home', to: 'user#home'
  root 'bugzilla#home'
  put 'bugs/:id/assgin', to: 'bugs#assginment', as: 'assgin_bug'
  put 'bugs/:id/comment', to: 'bugs#add_comments', as: 'bug_comment'
  get 'user/:id/edit', to: 'user#edit', as: 'edit_user'
  patch 'user/:id/edit', to: 'user#update', as: 'update_user'
  get 'show_users', to: 'user#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
