class ApplicationController < ActionController::Base
  before_action :authenticate_advisor!

  protect_from_forgery with: :exception
end
