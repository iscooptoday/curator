class AddTopicSearchesIndices < ActiveRecord::Migration
  def up
ActiveRecord::Base.connection.execute <<-SQL
CREATE INDEX index_topics_on_author ON topics USING gin(to_tsvector('english', author));
CREATE INDEX index_topics_on_tag_list ON topics USING gin(to_tsvector('english', tag_list));
CREATE INDEX index_topics_on_user_user_name ON users USING gin(to_tsvector('english', user_name));

SQL
end
def down
ActiveRecord::Base.connection.execute <<-SQL
DROP INDEX index_topics_on_author;
DROP INDEX index_topics_on_tag_list;
DROP INDEX index_users_on_user_name;

SQL
end
end
