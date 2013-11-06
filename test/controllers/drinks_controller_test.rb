require 'test_helper'

class DrinksControllerTest < ActionController::TestCase

  def test_controller_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:drinks)
  end

  def test_renders_correct_template
    get :index
    assert_template :index
    assert_template layout: "layouts/application"

    css_select('content') do
      assert_select 'li', 2
    end
  end

end
