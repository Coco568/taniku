class Post < ApplicationRecord
  belongs_to :user 
  mount_uploader :image, PictureUploader
  validates :content,  length: {maximum: 200}
end
