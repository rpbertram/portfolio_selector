class AllocationsController < ApplicationController
  def index
    @allocations = Allocation.page(params[:page]).per(10)

    render("allocations/index.html.erb")
  end

  def show
    @allocation = Allocation.find(params[:id])

    render("allocations/show.html.erb")
  end

  def new
    @allocation = Allocation.new

    render("allocations/new.html.erb")
  end

  def create
    @allocation = Allocation.new

    @allocation.client_id = params[:client_id]
    @allocation.fund_id = params[:fund_id]
    @allocation.percentage = params[:percentage]

    save_status = @allocation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/allocations/new", "/create_allocation"
        redirect_to("/allocations")
      else
        redirect_back(:fallback_location => "/", :notice => "Allocation created successfully.")
      end
    else
      render("allocations/new.html.erb")
    end
  end

  def edit
    @allocation = Allocation.find(params[:id])

    render("allocations/edit.html.erb")
  end

  def update
    @allocation = Allocation.find(params[:id])

    @allocation.client_id = params[:client_id]
    @allocation.fund_id = params[:fund_id]
    @allocation.percentage = params[:percentage]

    save_status = @allocation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/allocations/#{@allocation.id}/edit", "/update_allocation"
        redirect_to("/allocations/#{@allocation.id}", :notice => "Allocation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Allocation updated successfully.")
      end
    else
      render("allocations/edit.html.erb")
    end
  end

  def destroy
    @allocation = Allocation.find(params[:id])

    @allocation.destroy

    if URI(request.referer).path == "/allocations/#{@allocation.id}"
      redirect_to("/", :notice => "Allocation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Allocation deleted.")
    end
  end
end
