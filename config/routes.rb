ActionController::Routing::Routes.draw do |map|
  map.resources :pages
  
  map.namespace :admin do |admin|
    admin.resources :pages, :collection => {:pending => :get}
    admin.resources :secrets
  end
  
  map.home "", :controller => "tasks"
  map.resources :tasks
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
