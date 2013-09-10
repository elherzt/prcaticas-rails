ExamRails::Application.routes.draw do
  root :to => "users#index"
  resources :users do
    resources :cars do 
      resources :comments
    end
  end

  #resources :cars do
    #resources :comments
  #end

get "/signin", to: "sessions#new"
post "/signin", to: "sessions#create"
end
