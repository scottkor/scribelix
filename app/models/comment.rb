class Comment < ActiveRecord::Base
   validates_presence_of :comment
   
   belongs_to :micropost
   belongs_to :user
end
