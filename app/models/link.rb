class Link < ActiveRecord::Base

	belongs_to:topic
	acts_as_likeable

	has_many :link_attachments
   accepts_nested_attributes_for :link_attachments
    
   # for impressions 
   is_impressionable
	
 end
