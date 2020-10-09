Rails.application.routes.draw do
  devise_for :items
  devise_for :users
end
