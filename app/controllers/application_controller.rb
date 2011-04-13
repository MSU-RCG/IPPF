class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def use_nav
    @nav = true
  end
  
end
