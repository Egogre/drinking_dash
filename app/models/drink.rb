class Drink < ActiveRecord::Base
  has_many :order_items
  belongs_to :category
  validates :name, presence: true, length: { maximum: 25 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image_url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, if: :image_url }


  def self.search(search)
    if search
      select { |drink| drink.name =~ /#{search}/i }
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
