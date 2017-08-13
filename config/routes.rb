Rails.application.routes.draw do
  post 'user/login' => 'user#login'
  resources :user do
  	resources :items
  end
end