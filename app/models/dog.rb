class Dog < ApplicationRecord

  belongs_to :user
  acts_as_votable
  has_many :likes



  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def get_city
    Geocoder.search("#{self.latitude},#{self.longitude}").first.try(:city)
  end

  mount_uploader :picture, PhotoUploader
end
