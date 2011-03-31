module ApplicationHelper
  
  def breadcrumbs
    crumbs = "<a href='/'>IPPF</a> "
    # crumbs +=  controller.controller_name + controller.action_name
    case (controller.controller_name + controller.action_name)
    when "sessionsnew"
      crumbs += "&gt; Sign In"
    when "registrationsnew"
      crumbs += "&gt; Sign Up"
    when "jobsindex"
      crumbs += "&gt; Jobs"
    end
    crumbs
  end
end
