class Topic < ActiveRecord::Base
	validates_uniqueness_of :description
	
  acts_as_followable
  
		
  has_many:links , dependent: :destroy
  belongs_to:user

  def to_param
    description
  end
end
