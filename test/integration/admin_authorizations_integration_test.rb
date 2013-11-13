require "test_helper"

class AdminPrivledgesTest <Capybara::Rails::TestCase

  def test_non_users_cant_create_new_drinks
    visit new_drink_path
    refute_equal current_path, new_drink_path
  end

  def test_non_users_cant_access_dashboard
    visit "/dashboard"
    refute_equal current_path, dashboard_path
  end
end
