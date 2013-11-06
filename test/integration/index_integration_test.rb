require "test_helper"

class IndexIntegrationTest < Capybara::Rails::TestCase

  def test_it_exists
    visit root_path
    assert_equal 200, page.status_code
  end

  def test_menu_is_a_link
    visit root_path
    click_on 'Menu'
    assert_equal current_path, categories_path
  end

  #home button
  def test_home_is_a_link
    visit root_path
    click_on 'Home'
    assert_equal current_path, root_path
  end

  #contact button
  def test_contact_is_a_link
    skip
    visit root_path
    click_on 'Contact'
    assert_equal current_path, contact_path
  end

  def test_page_renders_shopping_cart
    visit root_path
    within('#sidebar') do
      assert page.has_content?("Shopping Cart")
    end
  end

  def test_login_works
    visit root_path

    within('#login') do
      fill_in 'email', :with => 'user@example.com'
      fill_in 'password', :with => 'password'
    end

    assert page.has_content?("Welcome user@example.com")
  end

end
