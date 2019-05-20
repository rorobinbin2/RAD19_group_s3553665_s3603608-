class LayoutsController < ApplicationController
    
  def index
    @categories = Category.all
  end
end