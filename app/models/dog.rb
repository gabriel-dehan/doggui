class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings , dependent: :destroy
  has_many :likes
  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
end
