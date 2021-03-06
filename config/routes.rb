ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :courses  # Sample resource route with options:
  map.resource :session
  map.resources :course_instances
  map.root :controller => "courses"
  # See how all your routes lay out with "rake routes"
  
  map.resources :courses do |course|
    course.resources :course_instances
  end  
  
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
