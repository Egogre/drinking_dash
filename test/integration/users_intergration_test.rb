require "test_helper"

class IndexIntegrationTest < Capybara::Rails::TestCase

  def sign_in
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

  def test_user_can_sign_up
    visit root_path
    assert_equal root_path, current_path
    sign_in
    assert_equal root_path, current_path
    refute page.has_content?("Sign up now!")
  end

  def test_user_is_prompted_to_sign_in
    visit root_path
    assert page.has_content?("Sign up")
  end

  def test_user_has_access_to_show_page
    sign_in
    click_on "Profile"
    assert page.has_content?("Jeff")
  end

  def test_user_can_change_name
    sign_in
    click_on "Profile"
    click_on "Edit"

    fill_in "Name", with: "j3"
    click_on "Edit Your Information"
    assert page.has_content?("j3")
  end
end
