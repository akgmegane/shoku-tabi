class Micropost < ApplicationRecord
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
