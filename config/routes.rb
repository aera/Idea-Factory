Rails.application.routes.draw do

  # flags
  post('ideas/:idea_id/reviews/:id', to: 'reviews#flag')
  # likes
  post('ideas/:id', to: 'ideas#like')

  resources :sessions, only: [:new, :create] do
	   delete :destroy, on: :collection
  end


  resources :users, only: [:new, :create] do
    
  end

  resources :ideas do
	   resources :reviews, only: [:create, :destroy, :update]
  end

  root 'ideas#index', as: 'home'
end
