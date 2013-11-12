require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  def test_card_number_can_only_be_numbers
    assert_raise(ActiveRecord::RecordInvalid) do
      Payment.create!(card_type: "Visa", credit_card_number: "Q234123412341234",
		      expiration_date: "0117")
    end
  end

  def test_card_type_cant_be_anything
    assert_raise(ActiveRecord::RecordInvalid) do
      Payment.create!(card_type: "ASDASDas", credit_card_number: "1234123412341234",
		      expiration_date: "0117")
    end
  end

  def test_expiration_date_has_to_be_real
    assert_raise(ActiveRecord::RecordInvalid) do
      Payment.create!(card_type: "Visa", credit_card_number: "1234123412341234",
		      expiration_date: "2117")
    end
  end
end
