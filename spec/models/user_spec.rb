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
  
end
