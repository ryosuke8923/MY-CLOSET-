Rails.application.routes.draw do
  devise_for :hello_users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'accesses/hello'

  get 'accesses/goodbye'
  get 'accesses/index', :to => "accesses#index", :as => "accesses_index"

  get 'accesses/show/:email', :to => 'accesses#show', :as => "accesses_show"

  root 'accesses#hello'

  get 'accesses/tag/:email', :to => "accesses#tag", :as => "accesses_tag"


  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
