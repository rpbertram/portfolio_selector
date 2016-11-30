class ClientsController < ApplicationController
  def index
    @clients = Client.all

    render("clients/index.html.erb")
  end

  def show
    @client = Client.find(params[:id])

    render("clients/show.html.erb")
  end

  def new
    @client = Client.new

    render("clients/new.html.erb")
  end

  def create
    @client = Client.new

    @client.advisor_id = params[:advisor_id]
    @client.clientname = params[:clientname]
    @client.accountsize = params[:accountsize]
    @client.mgmt_fee = params[:mgmt_fee]
    @client.risktolerance = params[:risktolerance]

    save_status = @client.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/clients/new", "/create_client"
        redirect_to("/clients")
      else
        redirect_back(:fallback_location => "/", :notice => "Client created successfully.")
      end
    else
      render("clients/new.html.erb")
    end
  end

  def edit
    @client = Client.find(params[:id])

    render("clients/edit.html.erb")
  end

  def update
    @client = Client.find(params[:id])

    @client.advisor_id = params[:advisor_id]
    @client.clientname = params[:clientname]
    @client.accountsize = params[:accountsize]
    @client.mgmt_fee = params[:mgmt_fee]
    @client.risktolerance = params[:risktolerance]

    save_status = @client.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/clients/#{@client.id}/edit", "/update_client"
        redirect_to("/clients/#{@client.id}", :notice => "Client updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Client updated successfully.")
      end
    else
      render("clients/edit.html.erb")
    end
  end

  def destroy
    @client = Client.find(params[:id])

    @client.destroy

    if URI(request.referer).path == "/clients/#{@client.id}"
      redirect_to("/", :notice => "Client deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Client deleted.")
    end
  end
end
