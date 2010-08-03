# == Schema Information
# Schema version: 20100801000721
#
# Table name: notes
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  validates_presence_of :title, :content
end
