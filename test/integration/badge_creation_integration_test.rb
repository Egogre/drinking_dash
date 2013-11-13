require "test_helper"

class IndexIntegrationTest < Capybara::Rails::TestCase

  def sign_up
    visit root_path
    assert_equal root_path, current_path
    click_on "Sign up now!"
    assert_equal signup_path, current_path
    within("form#new_user") do
      fill_in 'Name', :with => "Jeff"
      fill_in 'Email', with: "use@example.com"
      fill_in 'Password', with: "password"
      fill_in 'Confirmation', with: "password"
      click_on "Create my account"
    end
  end

  def test_newbie_badge_appears_on_show_page
    sign_in
    click_on "Profile"
    click_on "Profile"
    assert page.has_content?("Badges")
    assert page.has_content?("New User")
  end

end
