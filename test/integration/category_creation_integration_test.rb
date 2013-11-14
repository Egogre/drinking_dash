require "test_helper"

class CategoryCreationTest < Capybara::Rails::TestCase

  def test_it_exists
    visit categories_path
    assert_equal 200, page.status_code
  end

  def test_admin_can_create_new_category
    admin_sign_in
    visit new_category_path
    fill_in "category_drink_type", with: "teas"
    click_on "Submit"
    assert page.has_content?("teas"), "Should see new category appear"
  end

  def test_admin_can_edit_category
    admin_sign_in
    drink_type = Category.first.drink_type
    visit edit_category_path(Category.first)
    fill_in "category_drink_type", with: "teas"
    click_on "Submit"
    refute page.has_content?(drink_type), "Should not have old category name"
    assert page.has_content?("teas"), "Should have new category name"
  end

  def test_admin_can_destory_category
    admin_sign_in
    drink_type = Category.first.drink_type
    visit edit_category_path(Category.first)
    click_on "Destroy"
    visit categories_path
    refute page.has_content?(drink_type), "Should not have old category name"
  end


    def admin_sign_in
      visit root_path
      fill_in "Email", with: "rolen@example.com"
      fill_in "Password", with: "password"
      click_on 'Sign In'
    end
end
