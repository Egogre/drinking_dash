require 'test_helper'

class DrinkTest < ActiveSupport::TestCase

  def test_drink_has_category
    beer_cat = Category.create(drink_type: "Beer")
    beer = Drink.create(name: "Dale's Pale Ale", category_id: beer_cat.id)
    assert_equal beer_cat.id, beer.category_id
  end

  def test_drink_name_must_be_presence
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "", description: "WTF?", price: 1.00
    end
  end

  def test_drink_name_cant_longer_than_25
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Q" * 26, description: "bad stuff", price: 4.00
    end
  end

  def test_drink_description_must_be_presence
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Diet Coke", description: "", price: 2.99
    end
  end

  def test_drink_description_cant_be_longer_than_140_characters
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Water", description: "Boring" * 100, price: 5
    end
  end

  def test_drink_price_has_to_be_present
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Tea", description: "Ok, I guess"
    end
  end

  def test_drink_price_has_to_be_a_number
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Tea", description: "Ok, I guess", price: "string"
    end
  end

  def test_drink_price_cant_be_negative
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Tea", description: "Ok, I guess", price: -1
    end
  end

  def test_drink_name_has_to_be_unqiue
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Tea", description: "Ok, I guess", price: 1
      Drink.create! name: "Tea", description: "Ok, I guess", price: 1
    end
  end

  def test_drink_image_url_is_valid
    assert_raise ActiveRecord::RecordInvalid do
      Drink.create! name: "Tea", description: "Ok, I guess", price: 1, image_url: "asdasdas"
    end
  end

  def test_drink_has_valid_url
    Drink.create! name: "Tea", description: "Ok, I guess", price: 1, image_url: "http://www.amazon.com/stuff"
  end
end
