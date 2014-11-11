class Topic < ActiveRecord::Base

before_save { |topic| topic.author = topic.author.upcase }
	
	validates_uniqueness_of :description

	has_many:links
	belongs_to:user
	
  acts_as_followable
  acts_as_taggable
  
		
  
  

  def to_param
    description
  end
end
