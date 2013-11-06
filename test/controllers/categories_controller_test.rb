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
  end

  def test_renders_links_for_each_drink_category
    get :index
      css_select 'ul.beer' do
        css_select'li', 2
      end
  end

  def test_show_is_valid
    get :show, id: Category.all.first.id
    assert_response 200
  end

end
