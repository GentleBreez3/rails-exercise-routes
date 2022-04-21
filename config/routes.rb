Rails.application.routes.draw do

  # 1st one ---------
  resources :xyz, controller: "abcs", only: [:new, :create]
  # ----------

  # 2nd one ---------
  scope module: :admin do
    resources :abc, only: [] do
      resources :articles, only: [:index, :show]
    end
  end
  # ----------

  # 3rd one ---------
  scope module: :admin do
    resources :abc, only: [] do
      resources :articles, only: [:index, :show, :search] do
        member do
          get :search, to: "articles#search"
        end
        collection do
          get :search, to: "articles#search"
        end
      end
    end
  end
  # ----------

  # 4th one ---------
  scope module: :admin do
    resources :abc, only: [] do
      resources :articles, only: [:index, :show]
      resources :users, only: :show do
        resources :posts, only: :index
      end
    end
  end
  # ----------

  # 5th one ---------
  scope module: :admin do
    resources :abc, only: [] do
      resources :articles, only: [:index, :show]
      resources :users, only: :show do
        resources :details, only: [] do
          resources :test, controller: "posts", only: [:index]
        end
      end
    end
  end
  # ----------

  # 6th one ---------
  namespace :admin do
    resources :abc, only: [] do
      resources :users, only: [] do
        resources :posts, only: [:index] do
        end
      end
    end
    resources :users, only: [:show]
  end
  # ----------

  # 7th one ---------
  scope module: :admin do
    resources :test, controller: "posts", only: [:index, :show]
  end
  # ----------

  # 8th one ---------
  scope as: :admin do
    resources :users, only: [] do
      resources :posts, only: [] do
        resources:search, only: [:search]
        collection do
          get :search, to: "users#search_post"
        end
      end
    end
  end
  # ----------


  resources :articles
  root to: "articles#index"
end
