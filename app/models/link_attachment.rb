class LinkAttachment < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader
   belongs_to :link
end
