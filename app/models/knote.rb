# == Schema Information
# Schema version: 20100809054422
#
# Table name: knotes
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Knote < ActiveRecord::Base
  acts_as_taggable

end
