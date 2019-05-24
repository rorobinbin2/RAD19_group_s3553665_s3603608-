class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update] 
  before_action :correct_user,   only: [:create, :edit, :update]
  before_action :admin_user,     only: [:create, :edit, :update, :destroy]
  
  
  def index
    @categories = Category.all
    @locations = Location.all
    @courses = Course.all
  end  
  
  def show
    @categories = Category.all
    @locations = Location.all
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @categories = Category.all
    @locations = Location.all
  end
  
  def create

    @course = current_user.courses.new(course_params)
    @categories = Category.all
    @locations = Location.all
    if @course.save
      flash[:success] = "Created new course!"
      redirect_to(root_url)
    else
      render 'new'
    end
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to courses_url
    else
      render 'edit'
    end
  end  

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course removed"
    redirect_to courses_url
  end
  
  def hitlike
  end
  
  def hitdislike 
  end
  
  private
  
    def course_params
      # params.require(:course).permit(:name, :prerequisite, :description, :category_id => [], :location_id => [])
      params.require(:course).permit(:name, :prerequisite, :description, :category_id , :location_id, :picture)
    end
  
    
end