require "test_helper"

class ShoppingCartIntegrationTest < Capybara::Rails::TestCase

  def test_a_non_user_can_something_to_cart
    visit root_path
    within "#drink_#{Drink.all.first.id}" do
      click_on "Add to cart"
    end

    within "#sidebar" do
      assert page.has_content?("#{Drink.all.first.name}"), "Why is all the rum gone?"
    end
  end
end
