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
    when "usersindex"
      crumbs += "&gt; Users"
    end
    crumbs
  end
  
  def page_title
    page_title = "IPPF"
    
    page_title += case (controller.controller_name + controller.action_name)
    when "jobsindex"
      " :: Jobs"
    when "jobsnew"
      " :: New Job"
    else
      ""
    end
    page_title
  end
end
