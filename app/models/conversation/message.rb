class Conversation::Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: 'User', foreign_key: :user_id

  scope :not_of_user, ->(user) { where.not(sender: user) }
  scope :of_user, ->(user) { where(sender: user) }
  scope :not_read, -> { where(is_read: false) }
  scope :read, -> { where(is_read: true) }
  scope :of_dog, ->(dog) { joins(:conversation).where(conversations: { dog: dog })}

  after_create :send_message_recive_email


  def send_message_recive_email
    UserMailer.new_message(reciver_user, conversation.dog).deliver_now
  end

  def reciver_user
    if sender == conversation.dog.user
      user_id = conversation.messages.uniq(&:user_id).pluck(:user_id).select { |u| u != sender.id }
      User.find(user_id.first)
    else
      conversation.dog.user
    end
  end
end
