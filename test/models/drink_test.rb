require 'test_helper'

class DrinkTest < ActiveSupport::TestCase

  def test_drink_has_category
    beer_cat = Category.create(drink_type: "Beer")
    beer = Drink.create(name: "Dale's Pale Ale", category_id: beer_cat.id)
    assert_equal beer_cat.id, beer.category_id
  end
end
