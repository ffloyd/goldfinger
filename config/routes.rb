Rails.application.routes.draw do
  root 'home#index', via: %i(get post)
end
