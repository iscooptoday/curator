class AddStuffToLinks < ActiveRecord::Migration
  def change
    add_column :links, :stuff, :text
  end
end
