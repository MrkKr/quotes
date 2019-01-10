Rails.application.routes.draw do
  resources :quotes, :only => [:index, :new, :create] do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "quotes#index"
end
