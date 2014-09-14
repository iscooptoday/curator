class AddUrl5ToLinks < ActiveRecord::Migration
  def change
    add_column :links, :url5, :string
  end
end
