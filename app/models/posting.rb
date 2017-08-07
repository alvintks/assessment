class Posting < ApplicationRecord

  belongs_to :user
  mount_uploader :image, ImageUploader
  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode
  
  def self.search(search)
    search = search.downcase
    where("LOWER(description) LIKE ?", "%#{search}%")
  end
end
