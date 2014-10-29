class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:email, :password))
    
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @user.update(params.require(:user).permit(:email, :password))
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
