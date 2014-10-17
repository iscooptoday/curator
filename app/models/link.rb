class Link < ActiveRecord::Base
	belongs_to:topic
	mount_uploader :image, SirTrevorImageUploader
 
 end
