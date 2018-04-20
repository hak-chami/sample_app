class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate  :picture_size
  
  #CarrierWave画像と関連付け
  mount_uploader :picture, PictureUploader
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
  
  def picture_size
    if picture.size > 1.megabyte
        errors.add(:picture, "1MBまでアップロードできます")
    end
  end
  
end
