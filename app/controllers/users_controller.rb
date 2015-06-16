class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome!"
  	  redirect_to user_path(@user)
  	else
  		flash.now[:danger] = "invalid signup information"
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@user = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:success] = "User updated"
  		redirect_to user_path(@user)
  	else
  		flash.now[:danger] = 'Invalid information'
  		render 'users/edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	redirect_to users_path
  end

  private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me)
	end
end