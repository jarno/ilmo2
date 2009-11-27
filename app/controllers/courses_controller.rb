class CoursesController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index]  
  
  def index
  	@courses = Course.find_all
    @user = User.find_by_id(session[:id])
  end
  
  def show
  	@course = Course.find(params[:id])
  end
  
  def create
  	c = Course.new(params[:course])
    c.save
  	redirect_to(courses_path)
  end
  
end
