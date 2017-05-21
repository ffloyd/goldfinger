Rails.application.routes.draw do
  get 'home/index'
  post 'home/index'

  root controller: :home, action: :index
end
