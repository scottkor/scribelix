class CreatePrivateposts < ActiveRecord::Migration
  def self.up
    create_table :privateposts do |t|
      t.string :content
      t.integer :user_id
      t.string :title
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :privateposts
  end
end
