# == Schema Information
# Schema version: 20100729015904
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base
  validates_presence_of :title, :content
end
