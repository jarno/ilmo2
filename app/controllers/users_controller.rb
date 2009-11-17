require 'digest/sha1'


class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  
  skip_before_filter :authorize, :only => [:new, :create]  
  
  
  def index
    @users = User.all
    #raise session.inspect
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(session[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    a = User.new
    a.name = params[:user][:name]
    a.hashed_password = Digest::SHA1.hexdigest params[:user][:hashed_password]+"aasi"
    a.salt = "aasi"
    a.hashed_password_confirmation = Digest::SHA1.hexdigest params[:user][:hashed_password_confirmation]+"aasi"
    
    #raise params.inspect
    @user = a
    respond_to do |format|      
      if @user.save        
        flash[:whine] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    params[:user][:hashed_password] =  Digest::SHA1.hexdigest params[:user][:hashed_password]+@user.salt
    params[:user][:hashed_password_confirmation] = Digest::SHA1.hexdigest params[:user][:hashed_password_confirmation]+"aasi"
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(session[:id])
    @user.destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end
