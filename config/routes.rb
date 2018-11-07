Rails.application.routes.draw do
  devise_for :users

  root to: 'messages#index'
  post '/messages/like', to: 'messages#like', as: 'message_like'
  post '/messages/dislike', to: 'messages#dislike', as: 'message_dislike'
  resources :messages

end
