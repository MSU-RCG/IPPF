require 'spec_helper'

describe ChangelogController do
  describe "GET index" do
    it "should succeed, but do basically nothing" do
      get :index
    end
  end
end
