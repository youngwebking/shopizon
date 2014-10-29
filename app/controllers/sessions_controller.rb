class SessionsController < ApplicationController
  def new
  end
  
  def create
    params.permit(:email, :password)
    @user = User.where(email: params[:email].downcase).first.authenticate(params[:password])
    
    if @user
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
