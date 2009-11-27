require 'digest/sha1'
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :authorize
  before_filter :set_locale
  
  
  def set_locale
    # if this is nil then I18n.default_locale will be used
    I18n.locale = params[:locale] 
  end  
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def authorize
		if session[:id]
  	  @user = User.find_by_id(session[:id]) 
  	else
  	  redirect_to(root_url)
  	end  		  
  end
end
