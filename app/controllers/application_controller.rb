class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def admin_authorization
    redirect_to root_path unless self.admin?
  end
end
