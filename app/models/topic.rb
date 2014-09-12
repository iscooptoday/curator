class Topic < ActiveRecord::Base
	
  acts_as_followable
  
		
  has_many:links
end
