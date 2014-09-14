class AddUrl3ToLinks < ActiveRecord::Migration
  def change
    add_column :links, :url3, :string
  end
end
