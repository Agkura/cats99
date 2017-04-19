Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:new, :create]

  patch '/cat_rental_requests/:id/approve', to: 'cat_rental_requests#approve'
  patch '/cat_rental_requests/:id/deny', to: 'cat_rental_requests#deny'
end
