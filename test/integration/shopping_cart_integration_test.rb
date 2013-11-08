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

  def test_a_non_user_can_two_things_tocart
    visit root_path
    within "#drink_#{Drink.all.first.id}"do
      click_on "Add to cart"
      click_on "Add to cart"
    end

    within "#sidebar" do
      refute page.has_text?(%r{#{Drink.all.first.name}.*#{Drink.all.first.name}}), "Only one drink!"
      assert page.has_content?("2"), "I need two drinks!"
    end
  end
end
