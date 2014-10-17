class Link < ActiveRecord::Base
	belongs_to:topic
	mount_uploader :stuff, SirTrevorImageUploader
 
 end
