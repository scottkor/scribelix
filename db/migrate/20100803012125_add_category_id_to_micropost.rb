class AddCategoryIdToMicropost < ActiveRecord::Migration
  def self.up
    add_column :microposts, :category_id, :integer
  end

  def self.down
	remove_column :microposts, :category_id
  end
end
