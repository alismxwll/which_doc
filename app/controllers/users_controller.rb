class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User Information Updated"
      redirect_to user_path(@user)
    else
      flash[:alert] = "No Bueno."
      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.delete
      flash[:notice] = "User Deleted"
      redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
