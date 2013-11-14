class Payment < ActiveRecord::Base
  def self.credit_card_types
    ["Visa", "American Express", "MasterCard", "Discover"]
  end

  validates :credit_card_number, format: { with: /\A\d{16}\z/, message: "Numbers only" }
  validates :card_type, inclusion: { in: self.credit_card_types }
  validates :expiration_date, format: { with: /\A((10|11|12)|0[1-9])\d{2}\z/, message: "must be valid month and year" }
  belongs_to :user
  has_many :orders

  def self.format_expiration_date(month, full_year)
    month = "0" + month.to_s if month.length == 1

    month + full_year[-2..-1]
  end

  def create_new_payment(attributes)
    self.card_type = attributes[:card_type]
    self.credit_card_number = attributes[:credit_card_number]
    self.expiration_date = Payment.format_expiration_date(attributes["expiration_date(2i)"],
        					      attributes["expiration_date(1i)"])
    self.user_id = attributes[:user_id]
    self.save!
  end

end
