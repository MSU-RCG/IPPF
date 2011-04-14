require 'spec_helper'

describe "jobs/index.html.haml" do
  before(:each) do
    assign(:jobs, [
      stub_model(Job,
        :name => "Name",
        :job_type => "Job Type",
        :user_id => 1,
        :coordinates => "Coordinates",
        :status => "Status",
        :notes => "MyText"
      ),
      stub_model(Job,
        :name => "Name",
        :job_type => "Job Type",
        :user_id => 1,
        :coordinates => "Coordinates",
        :status => "Status",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    # assert_select "table", :count => 2
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Name".to_s, :count => 2
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Job Type".to_s, :count => 2
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => 1.to_s, :count => 2
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Coordinates".to_s, :count => 2
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "Status".to_s, :count => 2
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => "MyText".to_s, :count => 2

  end
end
