class UsersController < ApplicationController
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  public
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, flash: { success: 'User created!' }
    else
      render 'new'
    end
  end

  

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
    
  end
end
