class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include MeritHelper

  private

  def admin_authorization
    redirect_to root_path unless self.admin?
  end

  def user_authorization
    unless current_user
      redirect_to categories_path, notice: "you must login to place an order"
    end
  end
end
