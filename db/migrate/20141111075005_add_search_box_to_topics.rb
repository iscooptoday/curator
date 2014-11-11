class AddSearchBoxToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :search_box, :string
  end
end
