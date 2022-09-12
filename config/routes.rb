Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


#root to: 'home#index'
root to: 'notification#index'



#get '/schedule', to: 'schedule#index'


#get '/notification', to: 'notification#index'
post '/notification', to: 'notification#create_monitor'

#post '/save', to: 'schedule#save'
end
