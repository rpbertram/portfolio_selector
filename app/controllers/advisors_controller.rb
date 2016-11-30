class AdvisorsController < ApplicationController
  def index
    @advisors = Advisor.page(params[:page]).per(10)
  end

  def show
    @advisor = Advisor.find(params[:id])
  end
end
