require "test_helper"

class ShoppingCartIntegrationTest < Capybara::Rails::TestCase

  def test_a_non_user_can_something_to_cart
    visit categories_path
    within "#drink_#{Drink.all.first.id}" do
      click_on "Add to cart"
    end

    within "#sidebar" do
      assert page.has_content?("#{Drink.all.first.name}"), "Why is all the rum gone?"
    end
  end

  def test_a_non_user_can_two_things_tocart
    visit categories_path
    within "#drink_#{Drink.all.first.id}"do
      click_on "Add to cart"
      click_on "Add to cart"
    end

    within "#sidebar" do
      refute page.has_text?(%r{#{Drink.all.first.name}.*#{Drink.all.first.name}}), "Only one drink!"
      assert page.has_content?("2"), "I need two drinks!"
    end
  end

  def test_shopping_cart_clears
    visit categories_path
    within "#drink_#{Drink.all.first.id}"do
      click_on "Add to cart"
      click_on "Add to cart"
    end
    click_on "Empty Cart"
    within "#sidebar" do
      refute page.has_content?("#{Drink.all.first.name}"), "I wanted to clear my order"
    end
  end

  def test_it_gives_subtotal_for_line
    visit categories_path
    within "#drink_#{Drink.all.first.id}"do
      click_on "Add to cart"
      click_on "Add to cart"
    end
    within "#sidebar" do
      assert page.has_content?("$10.00"), "subtotal isn't showing"
    end
  end

  def test_it_gives_grand_total
    visit categories_path
    within "#drink_#{Drink.all.first.id}"do
      click_on "Add to cart"
      click_on "Add to cart"
    end
    within "#drink_#{Drink.all.last.id}"do
      click_on "Add to cart"
    end
    within "#sidebar" do
      assert page.has_content?("$19.99"), "grand total isn't showing"
    end
  end

  def test_it_places_order
    visit categories_path
    within "#drink_#{Drink.all.first.id}"do
      click_on "Add to cart"
      click_on "Add to cart"
    end
    within "#drink_#{Drink.all.last.id}"do
      click_on "Add to cart"
    end
      click_on "Place Order"
      assert page.has_content?("$19.99"), "grand total not showing"
      assert page.has_content?("Pay Us, Bitches!"), "On right page"
      select "Credit Card", from: "payment_type"
      fill_in "Card Number", with: "1234123412341234"
      select "T-2", from: "Table Number"
      click_on "Confirm"
      puts "PROFIT!"
      assert page_has_content?("Order Confirmed!"), "WE GOTZ DA MONIEZ?"
  end

end
