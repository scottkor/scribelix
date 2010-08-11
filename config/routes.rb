ActionController::Routing::Routes.draw do |map|
    map.resources :knotes


	map.resources :pages




  # You can have the root of your site routed with map.root 
  # -- just remember to delete public/index.html.
  map.root :controller => 'pages', :action => 'home'
  
  map.resources :users, :member => { :following => :get, :followers => :get }
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.resources :microposts 
  map.resources :privateposts
  map.resources  :relationships, :only => [:create, :destroy]
  map.resources :categories
  
  
  map.signin  '/signin',  :controller => 'sessions', :action => 'new'
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'
  
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.about   '/about',   :controller => 'pages', :action => 'about'
  map.help    '/help',    :controller => 'pages', :action => 'help'
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
