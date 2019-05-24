class SessionsController < ApplicationController

  def new
    @categories = Category.all
    @locations = Location.all
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = " Welcome " + current_user.name + " to Your Course App ! "
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "You have logged out !"
    redirect_to root_url
  end
end