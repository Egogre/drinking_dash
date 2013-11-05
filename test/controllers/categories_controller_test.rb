require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def test_controller_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  def test_renders_correct_template
    get :index
    assert_template :index
    assert_template layout: "layouts/application"
    assert_select 'ul' do
      assert_select 'li', 2
    end
  end

  def test_renders_links_for_each_drink_category
    get :index
    assert_select 'ul.categories' do
      assert_select 'ul.drink_type' do
        assert_select 'li'
      end
    end
  end

end
