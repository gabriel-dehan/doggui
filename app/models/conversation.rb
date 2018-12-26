class Conversation < ApplicationRecord
  belongs_to :dog
  has_many :messages
end
