require 'rails_helper'

RSpec.describe "Calendars", type: :system do
  describe '確認観点1：記録' do
    let(:user){ create(:user) }
    before do
      visit '/login'
      expect(page).to have_selector('label',text: 'Email'), 'Email というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: 'Password'), 'Password というラベルが表示されていることを確認してください'
      expect(page).to have_css("label[for='email']"), 'Email というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='password']"), 'Password というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_button('ログイン'), 'ログイン用のボタンが表示されていることを確認してください'
        fill_in 'Email', with: user.email
        fill_in 'Password' ,with: 'password'
        find('#login-button').click

      visit '/calendars'
      expect(page).to have_selector("label", text: "記録の種類"),"記録の種類というラベルが表示されていることを確認してください"
      expect(page).to have_selector("label", text: "日付"),"日付というラベルが表示されていることを確認してください"

      expect(page).to have_css("select#calendar_date_type"),"記録の種類を選択できることを確認してください"
      expect(page).to have_css("input#calendar_record_date"), "日付入力できることを確認してください"
      
      expect(page).to have_button("登録する"), "登録するというボタンが表示されていることを確認してください"
    end
    it '1-1 記録の種類と日付を登録できる'do
      expect{
        find("#calendar_date_type").find("option[value='watering_date']").select_option
        fill_in '日付', with: 2.week.from_now
        click_on '登録する'
      }.to change{Calendar.count}.by(1)
    end

    it '1-2 登録した記録を編集できる' do
      calendar = create(:calendar, user: user) 
      visit edit_calendar_path(calendar)
      expect{
        fill_in '日付', with: 3.week.from_now
        click_on '更新'
      }
    end

    it '1-3 登録した記録を削除できる' do
      calendar = create(:calendar, user: user) 
      visit edit_calendar_path(calendar)
      click_on '削除'
      change{Calendar.count}.by(0)
    end
  end
end