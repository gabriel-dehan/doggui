class Dog < ApplicationRecord

  belongs_to :user
  acts_as_votable
  has_many :likes

  mount_uploader :picture, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def get_city
    Geocoder.search("#{self.latitude},#{self.longitude}").first.try(:city)
  end



  include PgSearch
  pg_search_scope :search_by_breed_and_address,
    against: [ :breed, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


end
