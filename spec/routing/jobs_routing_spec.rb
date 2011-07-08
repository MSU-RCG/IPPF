require "spec_helper"

describe JobsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/jobs" }.should route_to(:controller => "jobs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/jobs/new" }.should route_to(:controller => "jobs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/jobs/1" }.should route_to(:controller => "jobs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/jobs/1/edit" }.should route_to(:controller => "jobs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/jobs" }.should route_to(:controller => "jobs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/jobs/1" }.should route_to(:controller => "jobs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/jobs/1" }.should route_to(:controller => "jobs", :action => "destroy", :id => "1")
    end

    it "recognizes and generates #generate_coords_txt" do
      { :post => "/jobs/1/generate_coords_txt" }.should route_to(:controller => "jobs", :action => "generate_coords_txt", :id => "1")
    end
  end
end
