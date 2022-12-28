class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :icon, IconUploader
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, length: { minimum: 3}, if: -> {new_record? || changes[:crypted_password]}
  validates :password, confirmation: true, if: -> {new_record? || changes[:crypted_password]}
  validates :password_confirmation, presence: true, if: -> {new_record? || changes[:crypted_password]}
  validates :gender, presence: true
  enum gender: {closed: 0, male: 1, female: 2, other: 3}

end
