Rails.application.routes.draw do
  resources :posts do
    resources :post_comments
    member do
      patch :approve
      patch :mark_as_spam
      patch :favorite
    end
  end
  resources :topics
end
