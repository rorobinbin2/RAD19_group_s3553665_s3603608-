class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:hitlike, :hitdislike, :create, :edit, :update] 
  before_action :correct_user,   only: [ :edit, :update]
  before_action :admin_user,     only: [ :edit, :update, :destroy]
  
  
  def index
    @categories = Category.all
    @locations = Location.all
    @courses = Course.all
  end  
  
  def reload
    @course = Course.all
    redirect_back(fallback_location: root_path)
    puts(@course)
  end  
  
  def show
    @categories = Category.all
    @locations = Location.all
    @course = Course.find(params[:id])
    @courses = Course.all
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
    @course.like = 0
    @course.dislike = 0
    if @course.save
      flash[:success] = "Created new course!"
      redirect_to courses_url
    else
      render 'new'
    end
  end
  
  def edit
    @categories = Category.all
    @locations = Location.all
    @course = Course.find(params[:id])
  end
  
  def update
    @categories = Category.all
    @locations = Location.all
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to @course
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
    @course = Course.where("name = ?",params[:course_name]).first
    @course.like = @course.like + 1
    @course.save
    reload
  end
  
  def hitdislike 
    @course = Course.where("name = ?",params[:course_name]).first
    @course.dislike = @course.dislike + 1
    @course.save
    reload
  end
  
  def resetvote
    @course = Course.where("name = ?",params[:course_name]).first
    @course.like = 0
    @course.dislike = 0
    @course.save
    flash[:success] = 'Success, the course\'s votes has been reset !.'
    reload
    
  end
  
  
  
  private
  
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :category_id , :location_id )
    end
    
    def correct_user
      @course = current_user.courses.find_by(id: params[:id])
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end