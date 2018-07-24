class ChangePhotoInAvatarAndPicturein2models < ActiveRecord::Migration[5.2]
  def change
  	rename_column :user, :photo, :avatar
  	rename_column :dog, :photo, :picture
  end
end
