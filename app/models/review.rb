class Review < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
end