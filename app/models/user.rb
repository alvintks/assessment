class User < ApplicationRecord
  has_many :postings
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
  enum status: [:user, :admin]
  has_secure_password

  def self.search(search)
    search = search.downcase
    where("LOWER(name) LIKE ?", "%#{search}%")
  end

end
