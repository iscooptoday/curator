class AddUrl4ToLinks < ActiveRecord::Migration
  def change
    add_column :links, :url4, :string
  end
end
