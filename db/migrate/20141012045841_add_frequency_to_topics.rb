class AddFrequencyToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :frequency, :string
  end
end
