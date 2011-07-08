require 'spec_helper'

describe "jobs/show.html.haml" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :name => "Name",
      :job_type => "Job Type",
      :user => assign(:user, stub_model(User, :email => 'foo@bat.com')),
      :coordinates => "Coordinates",
      :status => "Status",
      :notes => "MyText",
      :job_files => [
        stub_model(JobFile, :file_url => 'foo.zip'),
        stub_model(JobFile, :file_url => 'bar.zip')
        ]
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Job Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/foo@bat.com/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Coordinates/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
