Rails.application.routes.draw do


  get 'articles/index'
  #get '/articles', to: 'articles#index'
  resources :articles, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello', to: 'hello#index'
  post '/hello', to: 'hello#say_hello'
end
