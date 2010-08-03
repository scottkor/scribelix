class AddHighSchoolToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :highschool, :string
  end

  def self.down
    remove_column :users, :highschool
  end
end
