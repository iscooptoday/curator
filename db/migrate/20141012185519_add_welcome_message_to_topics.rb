class AddWelcomeMessageToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :welcome_message, :string
  end
end
