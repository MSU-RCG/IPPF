require 'spec_helper'

describe User do

  it "should be invalid without an email" do
    u = Factory.build(:user, :email => nil)
    u.should_not be_valid
    u.errors.on(:email).should_not be_empty
  end

  it "should be valid with valid data" do
    u = Factory.build(:user)
    u.should be_valid
  end
  
  it "should be able to have jobs" do
    u = Factory.build(:user)
    u.should respond_to(:jobs)
  end
  
  it "should be able to be an admin" do
    u = Factory.build(:admin)
    u.should be_admin
    u.should respond_to(:admin?)
  end
  
  it "should have an admin_properties convenience method" do
    User.should respond_to(:admin_properties)
    User.admin_properties.select{|p| p =~ /token|password/}.should be_empty
  end
  
  it "should have an admin_emails method that returns all administrative email addresses" do
    u = Factory(:admin)
    User.should respond_to(:admin_emails)
    User.admin_emails.should == [u.email]
  end
end
