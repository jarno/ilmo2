class CoursesController < ApplicationController
  def index
  	@courses = Course.find(:all)
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
