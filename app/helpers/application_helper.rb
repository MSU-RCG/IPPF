module ApplicationHelper
  
  def breadcrumbs
    site_location(:breadcrumbs)
  end
  
  def page_title
    site_location(:title)
  end
  
  
  private 
  
  def site_location(kind)
    tokens = ["IPPF"]
    raw_location = [controller.controller_name, controller.action_name].map(&:titleize).join(' ')

    tokens << case (raw_location)
    when "Jobs Index":            "Jobs"
    when "Jobs New":              "New Job"
    when "Jobs Show":             ["Job", @job.name]
    when "Registrations Create":  "Sign Up"
    when "Registrations New":     "Sign Up"
    when "Sessions New":          "Sign In"
    when "Passwords New":         "Password Reset"
    when "Users Show":            ["Users", @user.email]
    when "Users New":             "New User"
    when "Users Edit":            ["Edit User", @user.email]
    else
      raw_location
    end
    
    separator = case (kind)
    when :title:        " :: "
    when :breadcrumbs:  " &gt; "
    else
      " "
    end
    
    tokens.flatten.join(separator)
  end
  
end
