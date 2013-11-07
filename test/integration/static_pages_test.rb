require "test_helper"

class StaticPagesTest < Capybara::Rails::TestCase
  def test_about_page_has_content
    visit '/static_pages/about'
    assert page.has_content?('About')
  end

  def test_about_page_from_home_page
    visit root_path
    click_on 'About'
    assert_equal current_path, '/static_pages/home'
  end

  def test_contact_page_has_content
    visit '/static_pages/contact'
    assert page.has_content?('Contact')
  end

  def test_contact_page_from_home_page
    visit root_path
    click_on 'Contact'
    assert_equal current_path, '/static_pages/contact'
  end



end
