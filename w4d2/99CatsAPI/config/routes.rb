Rails.application.routes.draw do
  resources :cats do
    resources :cat_rental_requests do
      member do
        get 'approve'
      end
    end
  end
end
