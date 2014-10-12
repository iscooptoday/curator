class AddTimeToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :time, :string
  end
end
