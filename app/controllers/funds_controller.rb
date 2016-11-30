class FundsController < ApplicationController
  def index
    @funds = Fund.page(params[:page]).per(10)

    render("funds/index.html.erb")
  end

  def show
    @historicalperformance = Historicalperformance.new
    @allocation = Allocation.new
    @fund = Fund.find(params[:id])

    render("funds/show.html.erb")
  end

  def new
    @fund = Fund.new

    render("funds/new.html.erb")
  end

  def create
    @fund = Fund.new

    @fund.name = params[:name]
    @fund.risktolerance = params[:risktolerance]
    @fund.proxyflag = params[:proxyflag]

    save_status = @fund.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/funds/new", "/create_fund"
        redirect_to("/funds")
      else
        redirect_back(:fallback_location => "/", :notice => "Fund created successfully.")
      end
    else
      render("funds/new.html.erb")
    end
  end

  def edit
    @fund = Fund.find(params[:id])

    render("funds/edit.html.erb")
  end

  def update
    @fund = Fund.find(params[:id])

    @fund.name = params[:name]
    @fund.risktolerance = params[:risktolerance]
    @fund.proxyflag = params[:proxyflag]

    save_status = @fund.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/funds/#{@fund.id}/edit", "/update_fund"
        redirect_to("/funds/#{@fund.id}", :notice => "Fund updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Fund updated successfully.")
      end
    else
      render("funds/edit.html.erb")
    end
  end

  def destroy
    @fund = Fund.find(params[:id])

    @fund.destroy

    if URI(request.referer).path == "/funds/#{@fund.id}"
      redirect_to("/", :notice => "Fund deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Fund deleted.")
    end
  end
end
