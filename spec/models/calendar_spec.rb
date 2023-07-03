require 'rails_helper'

RSpec.describe Calendar, type: :model do
  describe 'カレンダーを登録するとき' do
    it '種類と日付を入力すると成功する' do
      calendar = build(:calendar)
      expect(calendar).to be_valid
      expect(calendar.errors).to be_empty
    end

    it '日付の種類を空欄にすると失敗する' do
      calendar_without_date_type = build(:calendar, date_type: "")
      expect(calendar_without_date_type).to be_invalid
      expect(calendar_without_date_type.errors[:date_type]).to eq ["を入力してください"]
    end

    it '日付を空欄にすると失敗する' do
      calendar_without_date = build(:calendar, record_date: "" )
      expect(calendar_without_date).to be_invalid
      expect(calendar_without_date.errors[:record_date]).to eq ["を入力してください"]
    end
  end
end
