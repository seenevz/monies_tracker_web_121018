class UsersController < ApplicationController  
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to "/signup"
  end
  before_action :find_user, only: [:edit, :update, :destroy] 

  def new
    @user = User.new
  end
  
  def show
    authorized_for(params[:id])
    byebug
    find_user
  end
  
  def create
    @user = User.new(u_params)
    
    if @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end 
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.new(u_params)

    if @user.update(params.require(:user))
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def u_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :budget, :goal, :dob, :city)
  end
  
  def find_user
    @user = User.find(params[:id])
    
  end
end