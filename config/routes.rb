ExamRails::Application.routes.draw do
  #devise_for :users  
  devise_for :users, :controllers => {
    
    :omniauth_callbacks => "users/omniauth_callbacks"
  }


  root :to => "users#index"
  resources :users do
    resources :cars do 
      collection do
        get :search
      end
      resources :comments
      resources :tags do
        member do
          delete :remove
        end
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, defaults: {format: :xml}
    end
  end

end

