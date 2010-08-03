# == Schema Information
# Schema version: 20100729015904
#
# Table name: assets
#
#  id                :integer         not null, primary key
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  assetable_id      :integer
#  assetable_type    :string(25)
#  type              :string(25)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class AttachmentFile < Asset

  # === List of columns ===
  #   id                : integer 
  #   data_file_name    : string 
  #   data_content_type : string 
  #   data_file_size    : integer 
  #   assetable_id      : integer 
  #   assetable_type    : string 
  #   type              : string 
  #   locale            : integer 
  #   user_id           : integer 
  #   created_at        : datetime 
  #   updated_at        : datetime 
  # =======================

  has_attached_file :data,
                    :url => "/assets/attachments/:id/:filename",
                    :path => ":rails_root/public/assets/attachments/:id/:filename"
  
  validates_attachment_size :data, :less_than=>10.megabytes
end
