require "test_helper"

class UserTest < ActiveSupport::TestCase

  def test_new_user_has_no_badges_at_first
    user = User.create name: "SteveBob", email: "stevebob@example.com", password: "stuff111", password_confirmation: "stuff111"
    assert_equal [], user.badges
  end

  def test_newbie_badge_can_be_added_manually
    user = User.create name: "SteveBob", email: "stevebob@example.com", password: "stuff111", password_confirmation: "stuff111"
    user.add_badge(1)
    assert_equal "newbie", user.badges.first.name
  end

  def test_badge_has_image_and_description
    user = User.create name: "SteveBob", email: "stevebob@example.com", password: "stuff111", password_confirmation: "stuff111"
    user.add_badge(1)
    assert_includes user.badges.first.description, "New User"
    assert_includes user.badges.first.custom_fields, ".png"
  end
end
