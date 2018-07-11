class Dog < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :bookings , dependent: :destroy
end
