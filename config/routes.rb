Forem::Engine.routes.draw do
  root :to => "forums#index"

  resources :forums, :only => [:index, :show] do
    resources :topics
  end

  resources :topics do
    resources :posts do
      put :inappropriate
    end
  end

  namespace :admin do
    root :to => "base#index"
    resources :forums
    resources :topics do
      member do
        put :toggle_hide
        put :toggle_lock
        put :toggle_pin
      end
    end
    match 'inappropriate_posts', :to => "base#inappropriate_posts"
  end
end
