require 'test_helper'

class DrinkTest < ActiveSupport::TestCase

  def test_drink_has_category
    assert_equal 0, Drink.all.count
    Drink.create(name: "Diet Coke")
    assert Drink.all.first.category
    Drink.drop_table
  end
end
