Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/welcome', to: 'welcome#welcome'
       
get '/login', to: 'login#login'

get '/manual', to: 'manual#course_manual'

get '/notification', to: 'notify#notification'
end
