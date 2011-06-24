class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin!
  before_filter :use_nav
  
  # GET /users
  # GET /users.xml
  # GET /users.json                                      HTML and AJAX
  #-------------------------------------------------------------------
  def index
    @users = User.all
    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml => @users }
      format.html
    end
  end
  
  # GET /users/new
  # GET /users/new.xml 
  # GET /users/new.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def new
    @user = User.new
    respond_to do |format|
      format.json { render :json => @user }   
      format.xml  { render :xml => @user }
      format.html
    end
  end
  # 
  # GET /users/1
  # GET /users/1.xml
  # GET /users/1.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def show
    @user = User.get(params[:id])
    if @user
      respond_to do |format|
        format.json { render :json => @user }
        format.xml  { render :xml => @user }
        format.html      
      end
    else
      render :template => 'application/404', :status => :not_found
    end
  end
  # 
  # GET /users/1/edit  
  # GET /users/1/edit.xml
  # GET /users/1/edit.json                               HTML AND AJAX
  # -------------------------------------------------------------------
  def edit
    @user = User.get(params[:id])
    if @user
      respond_to do |format|
        format.json { render :json => @user }   
        format.xml  { render :xml => @user }
        format.html
      end
    else
      render :template => 'application/404', :status => :not_found
      # render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404
    end
  end
  
  # 
  # DELETE /users/1     
  # DELETE /users/1.xml
  # DELETE /users/1.json                               HTML AND AJAX
  #-----------------------------------------------------------------
  def destroy
    @user = User.get(params[:id])
    @user.destroy!
  
    respond_to do |format|
      format.json { render :json => @user.to_json, :status => 200 }
      format.xml  { head :ok }
      format.html { redirect_to users_path, :notice => 'User was successfully deleted.' }      
    end
  end
  # 
  # POST /users
  # POST /users.xml         
  # POST /users.json                                   HTML AND AJAX
  #-----------------------------------------------------------------
  def create
    @user = User.new(params[:user])
  
    respond_to do |format|
      if @user.save
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to users_path, :notice => 'User was successfully created.' }
      else
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } 
        format.xml  { head :ok }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /users
  # PUT /users.xml         
  # PUT /users.json                                    HTML AND AJAX
  #-----------------------------------------------------------------
  def update
    @user = User.get(params[:id])
    
    respond_to do |format|
      if @user.update(params[:user])
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
      else
        format.json { render :text => "Could not update user", :status => :unprocessable_entity } 
        format.xml  { head :ok }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
  
end
