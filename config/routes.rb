Rails.application.routes.draw do
  # Routes for the Client resource:
  # CREATE
  get "/clients/new", :controller => "clients", :action => "new"
  post "/create_client", :controller => "clients", :action => "create"

  # READ
  get "/clients", :controller => "clients", :action => "index"
  get "/clients/:id", :controller => "clients", :action => "show"

  # UPDATE
  get "/clients/:id/edit", :controller => "clients", :action => "edit"
  post "/update_client/:id", :controller => "clients", :action => "update"

  # DELETE
  get "/delete_client/:id", :controller => "clients", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
