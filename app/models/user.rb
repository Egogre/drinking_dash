class User < ActiveRecord::Base
  has_merit

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :display_name, length: { in: 2..32, if: :display_name_present? }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, if: :password
  has_many :orders
  has_many :payments

  def unique_badge_add(id_num)
    if badge_array.include?(id_num)
    else
      self.add_badge(id_num)
    end
  end

  def badge_array
    badge_id_array = []
    self.badges.each do |badge|
      badge_id_array << badge.id
    end
    badge_id_array
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  def display_name_present?
    true if self.display_name
  end
end
