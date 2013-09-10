ExamRails::Application.routes.draw do
  root :to => "users#index"
  resources :users do
    resources :cars 
  end

get "/signin", to: "sessions#new"
post "/signin", to: "sessions#create"
end
