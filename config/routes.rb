ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'images', :action => 'index'
  map.resources :images
  %w( about ).each do |page|
    map.send("#{page}_page", "/#{page}", :controller => 'pages', :action => 'show', :page => page)
  end
end
