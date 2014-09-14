class AddUrl2ToLinks < ActiveRecord::Migration
  def change
    add_column :links, :url2, :string
  end
end
