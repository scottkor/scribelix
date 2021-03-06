# == Schema Information
# Schema version: 20100811030119
#
# Table name: privateposts
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  user_id     :integer
#  title       :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Privatepost < ActiveRecord::Base

  attr_accessible :content, :title, :tag_list, :tag, :tags, :tag_counts
  
  acts_as_taggable
  belongs_to :user
  belongs_to :category

  
  validates_presence_of :content, :user_id
  validates_length_of   :content, :maximum => 500
  
  validates_presence_of :title, :user_id
  validates_length_of   :title, :maximum => 400
  
  default_scope :order => 'created_at DESC'

  # Return privateposts from the users being followed by the given user.
  named_scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id)
      { :conditions => ["user_id IN (#{followed_ids}) OR user_id = :user_id",
                        { :user_id => user }] }
    end
end
