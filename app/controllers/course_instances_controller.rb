class CourseInstancesController < ApplicationController
  def show
    @instance = CourseInstance.find(params[:id])
  end

  def create
    @course = Course.find(params[:course_id])
  end

  def new  
  end

end
