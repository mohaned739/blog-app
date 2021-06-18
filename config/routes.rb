Rails.application.routes.draw do
  resources :sessions, only: [:create], path: '/login'
  resources :registerations, only: [:create], path: '/signup'
  post "AddPost", to: "posts#create"
  put "EditPost/:id(.:format)", to: "posts#update"
  get "ViewPosts", to: "posts#index"
  delete "DeletePost/:id(.:format)", to: "posts#destroy"
  post "AddComment", to: "comments#create"
  put "EditComment/:id(.:format)", to: "comments#update"
  delete "DeleteComment/:id(.:format)", to: "comments#destroy"
  post "AddTag", to: "tags#create"
  put "EditTag/:id(.:format)", to: "tags#update"
  delete "DeleteTag/:id(.:format)", to: "tags#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
