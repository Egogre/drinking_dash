class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
    @user = User.new
  end

  def show
    redirect_to root_path unless set_user == current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_path
      flash.notice = "Welcome to Dive Bar, #{@user.name}! Your account has been created."
    else
      redirect_to root_path, notice: "Unable to create account"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
