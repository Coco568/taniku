require 'rails_helper'

RSpec.describe "PictureBooks", type: :system do
  describe '観察観点2：図鑑登録' do
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

      visit new_picture_book_path
      expect(page).to have_selector('label', text: '品種名'),'品種名というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: '価格'),'価格というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: '購入店舗'),'購入店舗というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: '写真'),'写真というラベルが表示されていることを確認してください'
      expect(page).to have_selector('label', text: '購入日'),'購入日というラベルが表示されていることを確認してください'
      expect(page).to have_button('保存'), '保存のボタンが表示されていることを確認してください'

      expect(page).to have_css("label[for='picture_book_breed']"), '品種 というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='picture_book_price']"), '価格 というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='picture_book_shop']"), '購入店舗 というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css('input#picture_book_picture'), '写真 というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='picture_book_purchase_date']"), '購入日 というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
    end
    it '2-1 図鑑を登録する' do
      expect{
        fill_in '品種名', with: 'sample'
        fill_in '価格', with: '100'
        fill_in '購入店舗' ,with: 'ホームセンター'
        click_on '保存'
      }.to change{PictureBook.count}.by(1)
    end

    it '2-2 図鑑を編集する' do
      picturebook = create(:picture_book, user: user)
      visit edit_picture_book_path(picturebook)
      expect{
        fill_in '品種名', with: 'sample'
        fill_in '価格', with: '100'
        fill_in '購入店舗' ,with: 'ホームセンター'
        fill_in '購入日', with: 3.week.from_now.ago
        click_on '保存'
      }
    end

    it '2-3 図鑑を削除する' do
      picturebook = create(:picture_book, user: user)
      visit picture_book_path(picturebook)
      click_on '削除'
    end
  end
end
