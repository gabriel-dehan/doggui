class User < ApplicationRecord
  acts_as_voter
  has_many :dogs
  has_many :messages, class_name: 'Conversation::Message'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader

end
