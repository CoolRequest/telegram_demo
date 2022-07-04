Rails.application.routes.draw do
  post 'telegram/webhook'

  get 'setup' => 'setup#new'
  post 'setup' => 'setup#create'

  get 'incoming' => 'incoming#index'

  get 'sending' => 'sending#new'
  post 'sending' => 'sending#create'
end
