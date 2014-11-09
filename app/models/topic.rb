class Topic < ActiveRecord::Base
	validates_uniqueness_of :description

	has_many:links
	belongs_to:user
	
  acts_as_followable
  acts_as_taggable
  
		
  
  

  def to_param
    description
  end
end
