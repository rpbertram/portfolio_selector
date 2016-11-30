class AdvisorsController < ApplicationController
  def index
    @advisors = Advisor.all
  end

  def show
    @advisor = Advisor.find(params[:id])
  end
end
