Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#new'
  post '/links' => 'links#create'
  get '/s/:lookup_code' => 'links#show'
end
