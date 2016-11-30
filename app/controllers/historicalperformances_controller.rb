class HistoricalperformancesController < ApplicationController
  def index
    @q = Historicalperformance.ransack(params[:q])
    @historicalperformances = @q.result(:distinct => true).includes(:fund).page(params[:page]).per(10)

    render("historicalperformances/index.html.erb")
  end

  def show
    @historicalperformance = Historicalperformance.find(params[:id])

    render("historicalperformances/show.html.erb")
  end

  def new
    @historicalperformance = Historicalperformance.new

    render("historicalperformances/new.html.erb")
  end

  def create
    @historicalperformance = Historicalperformance.new

    @historicalperformance.fund_id = params[:fund_id]
    @historicalperformance.month = params[:month]
    @historicalperformance.performance = params[:performance]

    save_status = @historicalperformance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/historicalperformances/new", "/create_historicalperformance"
        redirect_to("/historicalperformances")
      else
        redirect_back(:fallback_location => "/", :notice => "Historicalperformance created successfully.")
      end
    else
      render("historicalperformances/new.html.erb")
    end
  end

  def edit
    @historicalperformance = Historicalperformance.find(params[:id])

    render("historicalperformances/edit.html.erb")
  end

  def update
    @historicalperformance = Historicalperformance.find(params[:id])

    @historicalperformance.fund_id = params[:fund_id]
    @historicalperformance.month = params[:month]
    @historicalperformance.performance = params[:performance]

    save_status = @historicalperformance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/historicalperformances/#{@historicalperformance.id}/edit", "/update_historicalperformance"
        redirect_to("/historicalperformances/#{@historicalperformance.id}", :notice => "Historicalperformance updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Historicalperformance updated successfully.")
      end
    else
      render("historicalperformances/edit.html.erb")
    end
  end

  def destroy
    @historicalperformance = Historicalperformance.find(params[:id])

    @historicalperformance.destroy

    if URI(request.referer).path == "/historicalperformances/#{@historicalperformance.id}"
      redirect_to("/", :notice => "Historicalperformance deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Historicalperformance deleted.")
    end
  end
end
