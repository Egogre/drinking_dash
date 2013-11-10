class DashboardController < ApplicationController

def index
  redirect_to root_path unless self.admin?
end

end
