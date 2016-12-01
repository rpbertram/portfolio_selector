Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "clients#index"
  # Routes for the Historicalperformance resource:
  # CREATE
  get "/historicalperformances/new", :controller => "historicalperformances", :action => "new"
  post "/create_historicalperformance", :controller => "historicalperformances", :action => "create"

  # READ
  get "/historicalperformances", :controller => "historicalperformances", :action => "index"
  get "/historicalperformances/:id", :controller => "historicalperformances", :action => "show"

  # UPDATE
  get "/historicalperformances/:id/edit", :controller => "historicalperformances", :action => "edit"
  post "/update_historicalperformance/:id", :controller => "historicalperformances", :action => "update"

  # DELETE
  get "/delete_historicalperformance/:id", :controller => "historicalperformances", :action => "destroy"
  #------------------------------

  # Routes for the Allocation resource:
  # CREATE
  get "/allocations/new", :controller => "allocations", :action => "new"
  post "/create_allocation", :controller => "allocations", :action => "create"

  # READ
  get "/allocations", :controller => "allocations", :action => "index"
  get "/allocations/:id", :controller => "allocations", :action => "show"

  # UPDATE
  get "/allocations/:id/edit", :controller => "allocations", :action => "edit"
  post "/update_allocation/:id", :controller => "allocations", :action => "update"

  # DELETE
  get "/delete_allocation/:id", :controller => "allocations", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Fund resource:
  # CREATE
  get "/funds/new", :controller => "funds", :action => "new"
  post "/create_fund", :controller => "funds", :action => "create"

  # READ
  get "/funds", :controller => "funds", :action => "index"
  get "/funds/:id", :controller => "funds", :action => "show"

  # UPDATE
  get "/funds/:id/edit", :controller => "funds", :action => "edit"
  post "/update_fund/:id", :controller => "funds", :action => "update"

  # DELETE
  get "/delete_fund/:id", :controller => "funds", :action => "destroy"
  #------------------------------

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
