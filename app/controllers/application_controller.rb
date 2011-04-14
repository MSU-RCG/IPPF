class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def use_nav
    @nav = true
  end
  
  def admin!
    unless current_user.admin?
      redirect_to root_url, :notice => "You must be an administrator."
    end
  end
  
end
