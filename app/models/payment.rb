class Payment < ActiveRecord::Base
  validates :credit_card_number, format: { with: /\A\d{16}\z/, message: "Numbers only" }
  validates :card_type, inclusion: { in: ["Visa", "American Express", "MasterCard", "Discover"] }
  validates :expiration_date, format: { with: /\A((10|11|12)|0[1-9])\d{2}\z/, message: "must be valid month and year" }
  belongs_to :user
  has_many :orders
end
