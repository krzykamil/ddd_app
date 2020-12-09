Rails.application.routes.draw do
  mount RailsEventStore::Browser => '/res' if Rails.env.development?

  resources :sales
end
