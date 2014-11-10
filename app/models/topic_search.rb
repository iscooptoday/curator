class TopicSearch < ActiveRecord::Base
extend Textacular


belongs_to :searchable
def results
if @query.present?
self.class.search(@query).preload(:searchable).map!(&:searchable).uniq.sort_by{|e| -e.created_at.to_i}
else
Search.none
end
end
end