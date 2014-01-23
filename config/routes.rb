Sabz::Application.routes.draw do

  devise_for :users

  resources :messages
  get '/messages/conversation/:user_id' => "messages#conversation", as: :conversation_messages

  root to: 'products#index'

  resources :requests do
    member do
      patch 'recycle'
      patch 'approve'
      patch 'unexpire'
    end
    collection do
      get :mine
      get :queue
    end
  end

  resources :products do
    member do
      patch 'recycle'
      patch 'approve'
      patch 'unexpire'
    end
    collection do
      get :mine
      get :queue
    end
  end
end
