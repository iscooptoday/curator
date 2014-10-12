class AddPublishTimeToLinks < ActiveRecord::Migration
  def change
    add_column :links, :publish_time, :string
  end
end
