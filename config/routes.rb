Rails.application.routes.draw do
  devise_for :users
  root to: "user#index"
  resources :albums do
    member do
      delete :delete_image_attachment
    end
    collection do
      post :tagged_photo
    end
    resources :comments
  end
 
  
  
end
