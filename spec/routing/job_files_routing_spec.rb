require "spec_helper"

describe JobFilesController do
  describe "routing" do
    
    it "recognizes and generates #create" do
      { :post => "/job_files/6cf2fff2-5b5c-11e0-ada7-002332d6f1b2" }.should route_to(:controller => "job_files", :action => "create", :uuid => "6cf2fff2-5b5c-11e0-ada7-002332d6f1b2")
    end
    
    # it "recognizes and generates #destroy" do
    #   { :delete => "/jobfiles/6cf2fff2-5b5c-11e0-ada7-002332d6f1b2" }.should route_to(:controller => "job_files", :action => "destroy", :uuid => "6cf2fff2-5b5c-11e0-ada7-002332d6f1b2")
    # end

  end
end