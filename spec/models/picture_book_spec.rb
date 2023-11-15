require 'rails_helper'

RSpec.describe PictureBook, type: :model do
  describe '多肉図鑑を登録する時、' do

    it '購入日、品種、金額、購入店舗を入力した場合成功する' do
      picture_book = build(:picture_book)
      expect(picture_book).to be_valid
      expect(picture_book.errors).to be_empty
    end
  end
end
 