class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.create(u_params)
    # redirect_to user_path(@user)
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user))
    # redirect_to user_path(@user)
  end

  private

  def u_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :budget, :goal, :dob, :city)
   end
end