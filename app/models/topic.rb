class Topic < ActiveRecord::Base
	validates_uniqueness_of :description
	
  acts_as_followable
  
		
  
  

  def to_param
    description
  end
end
