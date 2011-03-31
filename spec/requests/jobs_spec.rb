require 'spec_helper'

describe "Jobs" do
  describe "When Not Logged In" do
    it "GET /jobs" do
      get jobs_path
      response.status.should be(302)
    end
  end
end
