class User < ApplicationRecord
  acts_as_voter
  has_many :dogs
  has_many :messages, class_name: 'Conversation::Message'

  validates :first_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader


  def find_avatar
    avatar_url ? avatar_url : 'avatar.png'
  end

end
