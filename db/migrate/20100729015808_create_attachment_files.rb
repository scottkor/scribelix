class CreateAttachmentFiles < ActiveRecord::Migration
  def self.up
    create_table :attachment_files do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :attachment_files
  end
end
