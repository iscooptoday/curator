class AddAuthorToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :author, :string
  end
end
