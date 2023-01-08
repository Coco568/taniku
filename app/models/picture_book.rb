class PictureBook < ApplicationRecord
  belongs_to :user 
  attribute :shop, :string, default: "不明"
  attribute :name, :string, default: "名無し"
  validates :name, presence: true
  validates :price, numericality: true
  validates :shop, presence: true
end
