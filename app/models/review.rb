class Review < ApplicationRecord
  belong_to :bookings
  has_many :reviews, through: :bookings
end
