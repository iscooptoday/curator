class Link < ActiveRecord::Base

	belongs_to:topic
	acts_as_likeable
	
 end
