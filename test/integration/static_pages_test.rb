require "test_helper"

class StaticPagesTest < Capybara::Rails::TestCase

  def test_home_page_has_content
    visit '/'
    assert page.has_content?('We Are')
  end

  def test_home_page_is_root_page
    visit root_path
    assert page.has_content?('We Are')
  end




end
