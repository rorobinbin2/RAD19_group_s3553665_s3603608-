class LocationsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def index
    @locations = Location.all
  end
  
  def new
    @location = Location.new
  end
  
  def show
    @categories = Category.all 
    @locations = Location.all
    @courses = Course.all
    @location = Location.find(params[:id])
  end
  
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Created new Location!"
      redirect_to(root_url)
    else
      render 'new'
    end
    
  end

  private
  
    def location_params
      params.require(:location).permit(:name)
    end
end