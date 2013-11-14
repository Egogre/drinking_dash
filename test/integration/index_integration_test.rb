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

  def test_page_renders_shopping_cart
    visit root_path
    within('#sidebar') do
      assert page.has_content?("Shopping Cart")
    end
  end

  def test_login_works
    visit root_path

    within('#login') do
      fill_in 'Email', :with => 'rolen@example.com'
      fill_in 'Password', :with => 'password'
      click_on 'Sign In'
    end
    # save_and_open_page
    assert page.has_content?("Rolen")
  end

  def test_logout_works
    visit root_path
    within('#login') do
      fill_in 'Email', :with => 'rolen@example.com'
      fill_in 'Password', :with => 'password'
      click_on 'Sign In'
    end

    click_on("Sign Out")
    assert_equal current_path, root_path
  end

end
