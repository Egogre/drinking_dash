class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def edit
    redirect_to root_path unless set_user == current_user
  end

  def update
    if @user.update(basic_user_params)
      redirect_to user_path
      flash.notice = "#{@user.name}, your account information has been updated."
    end       
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

  def user_badges
    User.badges
  end

  def set_user
    @user = User.find(params[:id])
  end

  def basic_user_params
    params.require(:user).permit(:name, :email)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
