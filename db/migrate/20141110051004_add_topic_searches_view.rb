class AddTopicSearchesView < ActiveRecord::Migration
  
  def up
ActiveRecord::Base.connection.execute <<-SQL
CREATE OR REPLACE VIEW topic_searches AS




SELECT topics.id AS searchable_id,
'topic' AS searchable_type,
topics.welcome_message AS term
FROM topics

SQL

end

def down
ActiveRecord::Base.connection.execute <<-SQL
DROP VIEW topic_searches;
SQL
end
end
