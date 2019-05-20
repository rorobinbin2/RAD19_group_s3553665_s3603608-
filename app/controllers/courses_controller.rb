class CoursesController < ApplicationController
    
  def index
    @courses = Course.all
  end  
  
  def show
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
      redirect_to rool_url
    else
      render 'new'
    end
  end
  
#   def edit
#     @user = User.find(params[:id])
#   end
  
#   def update
#     @user = User.find(params[:id])
#     if @user.update_attributes(user_params)
#       flash[:success] = "Profile updated"
#       redirect_to @user
#     else
#       render 'edit'
#     end
#   end  
  
  private
  
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :category, :location, :user)
    end

end