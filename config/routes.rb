Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :events do 
    resources :event_sessions do
      get :view_attendees
      resources :session_bookings, only: [:new, :create, :destroy]	
    end
  end
  resources :categories
  namespace :session_bookings do
    get :approvals 
    patch :approve_or_reject
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
