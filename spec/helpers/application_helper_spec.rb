require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the JobsHelper. For example:
#
# describe JobsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  
  describe "Breadcrumbs" do
    it "creates breadcrumbs from the controller and action" do
      helper.should respond_to(:breadcrumbs)
    end

    it "should create a sensible default breadcrumb" do
      controller.stub(:controller_name) { "thing" }
      controller.stub(:action_name) { "blarg" }
      helper.breadcrumbs.should == "IPPF &gt; Thing Blarg"    
    end

    it "should use a custom response for a known breadcrumb" do
      controller.stub(:controller_name) { "jobs" }
      controller.stub(:action_name) { "index" }
      helper.breadcrumbs.should == "IPPF &gt; Jobs"    
    end
  end

  describe "Page Title" do
    it "creates page title from the controller and action" do
      helper.should respond_to(:page_title)
    end
  
    it "should create a sensible default page title" do
      controller.stub(:controller_name) { "thing" }
      controller.stub(:action_name) { "blarg" }
      helper.page_title.should == "IPPF :: Thing Blarg"    
    end
  
    it "should use a custom response for a known page title" do
      controller.stub(:controller_name) { "jobs" }
      controller.stub(:action_name) { "index" }
      helper.page_title.should == "IPPF :: Jobs"    
    end
  end

end
