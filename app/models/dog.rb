class Dog < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :bookings
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :picture, PhotoUploader
 end