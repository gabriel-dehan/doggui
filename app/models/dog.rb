class Dog < ApplicationRecord
  STATUSES = ["LOF Confirmé", "LOF Non confirmé"]

  belongs_to :user
  belongs_to :breed
  has_many :likes
  has_many :conversations, dependent: :destroy
  has_many :images, dependent: :destroy
  validates_length_of :images, maximum: 4
  accepts_nested_attributes_for :images, allow_destroy: true

  acts_as_votable

  mount_uploader :picture, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :picture, presence: true
  validates :nickname, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :weight, presence: true, numericality: true, inclusion: { in: (1.. 100).to_a }
  validates :color, presence: true
  validates :price, presence: true, numericality: true, inclusion: { in: (100.. 2000).to_a }
  validates :birthday_date, presence: true
  validates :description, presence: true
  validates_length_of :description, :minimum=>12


  scope :search_by_breed, ->(query) { joins(:breed).where("lower(breeds.name) LIKE ?", "%#{query.downcase}%") }

  def get_city
    Geocoder.search("#{self.latitude},#{self.longitude}").first.try(:city)
  end

  def age
    if birthday_date.present?
    now = Date.today
    months = (now.year * 12 + now.month) - (birthday_date.year * 12 + birthday_date.month)
      if (months < 12)
        "#{months} Mois"
      else
         "#{age = (months / 12)} An(s)"
      end
    end
  end
end
