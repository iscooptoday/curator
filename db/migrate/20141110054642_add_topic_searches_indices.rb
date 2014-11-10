class AddTopicSearchesIndices < ActiveRecord::Migration
  def up
ActiveRecord::Base.connection.execute <<-SQL
CREATE INDEX index_topics_on_author ON topics USING gin(to_tsvector('english', author));


SQL
end
def down
ActiveRecord::Base.connection.execute <<-SQL
DROP INDEX index_topics_on_author;


SQL
end
end
