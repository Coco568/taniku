class PictureBook < ApplicationRecord
  belongs_to :user 
  mount_uploader :picture, PictureUploader
  attribute :purchase_date, :date, default: Date.current.strftime
  validates :breed, presence: true
  validates :price, length: {maximum: 15}
  validates :shop, length: {maximum: 20}
  validates :purchase_date, presence: true
end
