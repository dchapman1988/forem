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

  resources :forums do
    resources :topics do
      put :breaking_news
    end
  end

  namespace :admin do
    root :to => "base#index"
    resources :bans
    resources :forums
    resources :topics do
      member do
        put :toggle_hide
        put :toggle_lock
        put :toggle_pin
      end
    end
    get 'inappropriate_posts', :controller => "base", :action => "inappropriate_posts"
  end
end
