class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def button
    @categories = Category.all
  end
  
  def show
    @categories = Category.all 
    @locations = Location.all
    @courses = Course.all
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Created new category!"
      redirect_to(root_url)
    else
      render 'new'
    end
    
  end

  private
  
    def category_params
      params.require(:category).permit(:name)
    end
end