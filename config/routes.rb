Rails.application.routes.draw do

  post '/searches' => 'search#create'
  root 'search#new'
  
end
