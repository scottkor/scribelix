class AddPostedToMicropost < ActiveRecord::Migration
  def self.up
	add_column :microposts, :posted, :datetime
  end

  def self.down
	remove_column :microposts, :posted
  end
end
