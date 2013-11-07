require "test_helper"

class IndexIntegrationTest < Capybara::Rails::TestCase
  def test_user_can_sign_uo
    visit new_user_path
    fill_in 'name', with: "Jeff"
    fill_in 'email', with: "use@example.com"
    fill_in 'password', with: "password"
    fill_in 'password_confirmation', with: "password"
    click_on "Create my account"
    assert_equal root_path, current_path
  end
end
