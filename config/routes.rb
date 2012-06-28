Spree::Core::Engine.routes.prepend do
  namespace :admin do
    get  '/inventory' => 'inventory#index', :as => :inventory
    post '/inventory/inline' => 'inventory#update_inline'
  end  
end
