class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user 
      redirect_to user, notice: "Welcome back to Dive Bar, #{user.name}! What can we do for you today?"
    else
      # flash.now[:error] = 'Invalid email/password combination'
      render 'new', notice: "Invalid Email/Password combination"
    end
  end

  def destroy
    cookies[:remember_token] = nil
    self.current_user = nil
    redirect_to root_path, notice: "Have a nice day!"
  end

end
