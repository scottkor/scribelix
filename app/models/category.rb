# == Schema Information
# Schema version: 20100803012125
#
# Table name: categories
#
#  id            :integer         primary key
#  category_name :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Category < ActiveRecord::Base

	validates_presence_of :category_name
	
	has_many :microposts
	
end
