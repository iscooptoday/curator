class AddPublishFrequencyToLinks < ActiveRecord::Migration
  def change
    add_column :links, :publish_frequency, :string
  end
end
