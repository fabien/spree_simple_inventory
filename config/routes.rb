Rails.application.routes.draw do
  namespace :admin do
    resource  :inventory
  end  
end
