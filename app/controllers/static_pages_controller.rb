class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @locations = Location.all
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
end