class CoursesController < ApplicationController
    
  def index
    @courses = Course.all
  end  
  
  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end
  
  def create
    @couse = Course.new()
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
  
    # def user_params
    #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # end

end