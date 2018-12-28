class Conversation < ApplicationRecord
  belongs_to :dog
  has_many :messages, dependent: :destroy

  scope :of_dog, ->(dog) { where(dog: dog) }
  scope :of_sender, ->(user) { joins(:messages).where(conversation_messages: { user_id: user }) }
end
