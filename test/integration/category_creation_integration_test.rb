require "test_helper"

class CategoryCreationTest < Capybara::Rails::TestCase
  
  def test_it_exists
    visit categories_path
    assert_equal 200, page.status_code
  end

end
