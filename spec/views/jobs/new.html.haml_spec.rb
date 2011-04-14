require 'spec_helper'

describe "jobs/new.html.haml" do
  before(:each) do
    assign(:job, stub_model(Job,
      :name => "MyString",
      :job_type => "MyString",
      :user_id => 1,
      :coordinates => "MyString",
      :status => "MyString",
      :notes => "MyText"
    ).as_new_record)
    
    controller.stub_chain(:current_user, :authentication_token).and_return('foo')
  end

  it "renders new job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "form", :action => jobs_path, :method => "post" do
    #   assert_select "input#job_name", :name => "job[name]"
    #   assert_select "select#job_job_type", :name => "job[job_type]"
    #   assert_select "input#job_x1", :name => "job[x1]"
    #   assert_select "input#job_x2", :name => "job[x2]"
    #   assert_select "input#job_y1", :name => "job[y1]"
    #   assert_select "input#job_y2", :name => "job[y2]"
    #   assert_select "textarea#job_notes", :name => "job[notes]"
    #   assert_select "input#job_uuid", :name => "job[uuid]"
    # end
  end
end
