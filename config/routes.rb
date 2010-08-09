ActionController::Routing::Routes.draw do |map|
  map.resources :fichas

  map.resources :estados_tratamientos

  map.resources :tratamientos

  map.resources :imagenes,
                :collection => {:new_archivo => :get}
              
  #map.resources :historias_clinicas_ortodoncias

  #map.resources :historias_clinicas_generales

  map.resources :permisos

  map.resources :perfiles
             
  map.resources :items


  map.resources :prestaciones


  map.resources :items


  map.resources :clinicas

  map.resources :consultorios

  map.resources :titulares,
                :collection => {:buscar => :get, :resultado => :post}

  map.resources :estados_laborales

  map.resources :tipos_documento


  map.resources :pacientes,
                :collection => {:search => :get, :result => :post},
                :member => {:new_tratamiento => [:get,:post],
                            :update_tratamiento => [:get, :post],
                            :changephoto => :get,:uploadphoto => :post,
                            :editfield => :get, :updatefield => :put, :cancelfield => :get,
                            :search_titular => :get, :results_titular => :post,
                            :update_titular => :put,
                            :new_titular => :get, :create_titular => :post,
                            :show_imagen => :get,
                            :listado_historias_clinicas => :get
                            
                            
                }do |paciente|
                             
                            
                              
                              paciente.resource :historia_clinica_general, :member => {:imprimir => :get}

                              paciente.resource :historia_clinica_ortodoncia, :member => {:imprimir => :get}


                            end

  map.resources :profesionales, :collection => {:buscar => :get, :resultado => :post}
  
  map.resources :archivos
                
  map.resources :estados_laborales



  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'usuarios', :action => 'create'
  map.signup '/signup', :controller => 'usuarios', :action => 'new'



  map.resources :usuarios

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  map.resources :obras_sociales, :collection => {:buscar => :get, :resultado => :post} do |obra_social|
     obra_social.resources :aranceles                     
  end
  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => "sessions", :action => 'new'

end
