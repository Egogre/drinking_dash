require "test_helper"

class DrinkCreationTest < Capybara::Rails::TestCase

  def test_it_exists
    visit drinks_path
    assert_equal 200, page.status_code
  end

  def test_it_creates_an_drink_with_a_title_and_body
    admin_sign_in
    visit new_drink_path

    within "#new_drink" do
    fill_in 'drink_name', :with => "Bud Light"
    fill_in 'drink_description', :with => "This is a great beer."
    fill_in 'drink_price', :with => 7.99
    select "beer", from: 'drink_category_id'
    click_on 'Submit'
    end
    assert page.has_content?("Bud Light"), "page should show beer name"
  end

  def test_admin_can_edit_drink
    admin_sign_in
    visit edit_drink_path(Drink.first)
    fill_in 'drink_name', :with => "Miller Light"
    click_on 'Submit'
    assert page.has_content?("Miller Light"), "page should show beer name"
  end

  def test_admin_can_destroy_drink
    admin_sign_in
    drink_name = Drink.first.name
    visit edit_drink_path(Drink.first)
    click_on "Destroy"
    visit categories_path
    refute page.has_content?(drink_name), "item shouldn't appear"
  end

  def admin_sign_in
    visit root_path
    fill_in "Email", with: "rolen@example.com"
    fill_in "Password", with: "password"
    click_on 'Sign In'
  end


end
