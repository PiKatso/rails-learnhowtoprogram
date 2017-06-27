Rails.application.routes.draw do
  resources :chapters do
    resources :sections
  end

  resources :sections do
    resources :lessons
  end
end
