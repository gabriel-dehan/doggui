class Image < ApplicationRecord
  belongs_to :dog
  mount_uploader :image, PhotoUploader
end
