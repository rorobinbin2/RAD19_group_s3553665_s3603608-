class CourseController < ApplicationController
# before_action :logged_in_user, only: [:create ]

  def index
    @course = Course.all
  end 
  
  def show
    @course = Course.find(params[:id])
  end
  
  def new 
    @course = Course.new
  end
  
  def create
    @course = Course.new
    if @course.save
      flash[:success] = "Added new course!"
    else
      render 'new'
    end
  end
  
  private
  
    # def course_params
    #   params.require(:course).permit(:name, :prerequisite, :category, :location)
    # end  
end
