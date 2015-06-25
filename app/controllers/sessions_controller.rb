class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
      remember user if params[:session][:remember_me] == '1'
  		redirect_to user
  	else
  		flash.now[:notice] = "invalid email/password pair"
  		render :new
  	end
  end

  def destroy
    if logged_in?
      log_out
      redirect_to root_path
    else
      flash[:alert] = "Must be logged in to log out"
      redirect_to login_path
    end
  end
end
