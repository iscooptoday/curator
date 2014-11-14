class Topic < ActiveRecord::Base

before_save { |topic| topic.author = topic.author.upcase }
	
	validates_uniqueness_of :description

	has_many:links
	belongs_to:user
	
  acts_as_followable
  acts_as_taggable
  
		
  # It returns the topicss whose authors field contain one or more words that form the query
  def self.search(query)
    # where(:author, query) -> This would return an exact match of the query
    where("author like ?", "%#{query}%") 
  end
  

  def to_param
    description
  end
end
