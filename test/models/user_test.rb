require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_validates_presence_name
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "" ,email: "user@example.com"
    end
  end

  def test_validates_name_length
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "a"*51 ,email: "user@example.com"
    end
  end

  def test_validates_presence_email
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user" ,email: ""
    end
  end

  def test_validates_presence_email_format
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user" ,email: "asfhjasjdfhlkasdhflaskdhjf"
    end
  end

  def test_email_is_unique
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user" ,email: "user@example.com"
      User.create! name: "user" ,email: "user@example.com"
    end
  end

  def test_email_is_case_insensitive
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user" ,email: "user@example.com"
      User.create! name: "user" ,email: "User@example.com"
    end
  end

  def test_it_should_respond_password_digest
    user = User.create name: "user", email: "test@example.com", password: "stuff111", password_confirmation: "stuff111"
    assert user.password_digest
  end

  def test_password_is_6c_chars
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user", email: "test@example.com", password: "f", password_confirmation: "f"
    end
  end

  def test_remember_token_is_created_on_save
    user = User.new name: "user", email: "test@example.com", password: "stuff111", password_confirmation: "stuff111"
    refute user.remember_token, "Remember token shouldn't save"
    user.save!
    assert user.remember_token,"Remember token should be saving"
  end

  def test_display_name_is_longer_than_two
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user", email: "test@example.com", password: "password1", password_confirmation: "password1", display_name: "x"
    end
  end

  def test_display_name_is_less_than_32
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user", email: "test@example.com", password: "pssword1", password_confirmation: "p", display_name: "x"*33
    end
  end

end
