require "spec_helper"

describe ChangelogController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/changelog" }.should route_to(:controller => "changelog", :action => "index")
    end
  end
end