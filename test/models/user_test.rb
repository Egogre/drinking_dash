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
    User.create name: "user", email: "test@example.com", password: "stuff111", password_confirmation: "stuff111"
    assert User.last.password_digest
  end

  def test_password_is_6c_chars
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create! name: "user", email: "test@example.com", password: "f", password_confirmation: "f"
    end
  end

  def test_remember_token_is_created_on_save
    user = User.new name: "user", email: "test@example.com", password: "stuff111", password_confirmation: "stuff111"
    refute user.remember_token
    user.save
    assert user.remember_token 
  end

  def test_it_signs_in_up_account_creation
    
  end    
end
