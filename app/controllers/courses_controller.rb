class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update] 
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:edit, :update, :destroy]
  
  
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
    datareturn
  end
  
  def hitdislike 
    @course = Course.where("name = ?",params[:course_name]).first
    @course.dislike = @course.dislike + 1
    @course.save
    datareturn
  end
  
  def reset
    @course = Course.find params[:id]
    if @course.like.zero? && @course.dislike.zero?
      redirect_to controller: 'admin', action: 'courses'
      flash[:notice] = 'The selected course currently has no votes to reset.'
    else
      data = Hash.new
      data[:like] = 0
      data[:dislike] = 0

      if @course.update data
        redirect_to controller: 'admin', action: 'courses'
        flash[:success] = 'Success, the course\'s votes has been reset !.'
      else
        redirect_to controller: 'admin', action: 'courses'
        flash[:notice] = 'Something went wrong, try again '
      end
    end
  end
  
  
  
  private
  
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :category_id , :location_id )
      # params.require(:course).permit(:name, :prerequisite, :description, :category_id , :location_id, :picture)
    end
    
    def correct_user
      @course = current_user.courses.find_by(id: params[:id])
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end