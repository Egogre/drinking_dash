require "test_helper"

class DrinkCreationTest < Capybara::Rails::TestCase

  def test_it_exists
    visit drinks_path
    assert_equal 200, page.status_code
  end

  def test_it_creates_an_drink_with_a_title_and_body
    skip
    visit drinks_path
    click_on 'New Drink'
    fill_in 'Name', :with => "PBR"
    fill_in 'Description', :with => "This is a great beer."
    fill_in 'Price', :with => 7.99
    fill_in 'drink_category_id', :with => 1
    click_on 'Submit'
    assert page.has_content?("PBR")
  end

end
