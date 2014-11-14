class Topic < ActiveRecord::Base


	
	validates_uniqueness_of :description

	has_many:links
	belongs_to:user
	
  acts_as_followable
  acts_as_taggable
  
		
  # It returns the topicss whose authors field contain one or more words that form the query
  def self.search(query)
    query = query.upcase
    # where(:author, query) -> This would return an exact match of the query
    where("upper(author) like ?", "%#{query}%") 
  end
  

  def to_param
    description
  end
end
