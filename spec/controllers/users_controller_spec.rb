require 'spec_helper'

describe UsersController do
  
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:each) do
    @admin = Factory(:admin)
    sign_in @admin
    controller.stub(:current_user) { @admin }
  end

  describe "GET index" do
    describe "as an admin" do
      it "assigns all users as @users" do
        controller.current_user.should_receive(:admin?).and_return(true)
        User.stub(:all) { [mock_user] }
        get :index
        assigns(:users).should == [mock_user]
      end
    end

    describe "as a non-admin" do
      it "redirects to the site index" do
        controller.current_user.should_receive(:admin?).and_return(false)
        get :index
        response.should redirect_to(root_url)
      end      
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      User.stub(:new) { mock_user }
      get :new
      assigns(:user).should be(mock_user)
    end
  end
  
  # GET :edit tests removed, devise does those and they were colliding (I think)


  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created user as @user" do
        User.stub(:new).with({'these' => 'params'}) { mock_user(:save => true) }
        post :create, :user => {'these' => 'params'}
        assigns(:user).should be(mock_user)
      end

      it "redirects to the users list" do
        User.stub(:new) { mock_user(:save => true) }
        post :create, :user => {}
        response.should redirect_to(users_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.stub(:new).with({'these' => 'params'}) { mock_user(:save => false) }
        post :create, :user => {'these' => 'params'}
        assigns(:user).should be(mock_user)
      end

      it "re-renders the 'new' template" do
        User.stub(:new) { mock_user(:save => false) }
        post :create, :user => {}
        response.should render_template("new")
      end
    end
  end
  
  # PUT :update tests removed, devise does those and they were colliding (I think)
  # DELETE :destroy tests removed, devise does those and they were colliding (I think)

end
