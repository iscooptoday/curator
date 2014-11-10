class Topic < ActiveRecord::Base
	include PgSearch
	pg_search_scope :search_by_welcome_message, :against => :welcome_message
	
	validates_uniqueness_of :description

	has_many:links
	belongs_to:user
	
  acts_as_followable
  acts_as_taggable
  
		
  
  

  def to_param
    description
  end
end
