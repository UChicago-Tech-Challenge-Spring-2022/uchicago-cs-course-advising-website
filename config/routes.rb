Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'welcome#welcome'
       
get '/manual', to: 'manual#course_manual'

get '/schedule', to: 'schedule#schedule'

get '/notification', to: 'notify#notification'
end
