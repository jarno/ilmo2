class SessionsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:create]
  
  def create
    params[:user][:hashed_password] =  Digest::SHA1.hexdigest params[:user][:hashed_password]+"aasi"
    @user = User.find_by_name_and_hashed_password(params[:user][:name], params[:user][:hashed_password])
    if @user
      session[:id] = @user.id
      #flash[:whine] = "logged in"
    else
      flash[:whine] = "bad account"
    end
    redirect_to(root_url)
  end
  
  def destroy
    reset_session
    flash[:whine]  = "logged out"
    redirect_to(root_url)
  end  
end
