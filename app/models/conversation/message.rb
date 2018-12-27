class Conversation::Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: 'User', foreign_key: :user_id

  scope :not_of_user, ->(user) { where.not(sender: user) }
  scope :not_read, -> { where(is_read: false) }
  scope :read, -> { where(is_read: true) }
end
