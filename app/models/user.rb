class User < ApplicationRecord
  include JpPrefecture
  authenticates_with_sorcery!
  mount_uploader :icon, IconUploader
  has_many :posts, dependent: :destroy
  has_many :calendars ,dependent: :destroy
  has_many :picture_books, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, length: { minimum: 6}, if: -> {new_record? || changes[:crypted_password]}
  validates :password, confirmation: true, if: -> {new_record? || changes[:crypted_password]}
  validates :password_confirmation, presence: true, if: -> {new_record? || changes[:crypted_password]}
  validates :gender, presence: true
  enum gender: {closed: 0, male: 1, female: 2, other: 3}
  jp_prefecture :prefecture_code, presence: true, default:0

  def own?(object)
    self.id == object.user_id 
  end
end
