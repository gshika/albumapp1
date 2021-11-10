Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
  end
  root to: "user#index"
  resources :albums do
    member do
      delete :remove_attachment
    end
    collection do
      post :tagged_photo
    end
    resources :comments
  end
 
  
  
end
