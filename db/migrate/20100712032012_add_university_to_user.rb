class AddUniversityToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :university, :string
  end

  def self.down
    remove_column :users, :university
  end
end
