class Drink < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 140 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
