class CreateLinkAttachments < ActiveRecord::Migration
  def change
    create_table :link_attachments do |t|
      t.integer :link_id
      t.string :avatar

      t.timestamps
    end
  end
end
