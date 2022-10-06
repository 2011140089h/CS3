Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cs3#main"
  get "cs3/main"
  post "cs3/login"
  post "cs3/main"=>"cs3#del_sesson"
end
