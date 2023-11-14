require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '確認観点3：ユーザー登録' do
    before do
      visit '/users/new'
      expect(page).to have_selector("label", text: "ユーザー名"),"ユーザー名というラベルが表示されていることを確認してください"
      expect(page).to have_selector("label", text: "メールアドレス"),"メールアドレスというラベルが表示されていることを確認してください"
      expect(page).to have_selector("label", text: "性別"),"性別というラベルが表示されていることを確認してください"
      expect(page).to have_selector("label", text: "都道府県"),"都道府県というラベルが表示されていることを確認してください"
      expect(page).to have_selector("label", text: "パスワード"),"パスワードというラベルが表示されていることを確認してください"
      expect(page).to have_selector("label", text: "パスワード(確認)"),"パスワード(確認)というラベルが表示されていることを確認してください"
      
      expect(page).to have_css("label[for='user_name']"), 'Name というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_email']"), 'Email というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_gender']"), 'Gender というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_prefecture_codes']"), 'Prefecture codes というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_password']"), 'Password というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      expect(page).to have_css("label[for='user_password_confirmation']"), 'Password confirmation というラベルをクリックすると対応するフィールドにフォーカスすることを確認してください'
      
      expect(page).to have_button('ユーザー登録'), 'ユーザー登録のボタンが表示されていることを確認してください'
    end 
      
  it '3-1：ユーザーの新規作成ができる' do
    expect{
      fill_in 'ユーザー名', with: 'test01'
      fill_in 'メールアドレス', with: 'test@example.com'
      find("#user_gender").find("option[value='closed']").select_option
      find("#user_prefecture_code").find("option[value='1']").select_option
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード(確認)', with: 'password'
      click_on 'ユーザー登録'
    }.to change { User.count }.by(1)
    expect(current_path).to eq(login_path), 'ユーザー作成後にログイン画面に遷移できていません'
  end

  it '3-2：同じメールアドレスのユーザーは新規作成できない' do
    user = create(:user)
    expect{
      fill_in 'ユーザー名', with: 'test01'
      fill_in 'メールアドレス', with: user.email
      find("#user_gender").find("option[value='closed']").select_option
      find("#user_prefecture_code").find("option[value='1']").select_option
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード(確認)', with: 'password'
      click_on 'ユーザー登録'
    }.to change { User.count }.by(0)
    expect(page).to have_content('メールアドレスはすでに存在します'), 'エラーメッセージが表示されていることを確認してください'
  end

  it '3-3：パスワードが6文字以内の時ユーザー登録できない' do
    expect{
      fill_in 'ユーザー名', with: 'test01'
      fill_in 'メールアドレス', with: 'test@example.com'
      find("#user_gender").find("option[value='closed']").select_option
      find("#user_prefecture_code").find("option[value='1']").select_option
      fill_in 'パスワード', with: '01'
      fill_in 'パスワード(確認)', with: '01'
      click_on 'ユーザー登録'
    }.to change { User.count }.by(0)
    expect(page).to have_content('パスワードは6文字以上で入力してください'), 'エラーメッセージが表示されていることを確認してください'
  end

  it '3-4：入力項目が不足ている場合にユーザー登録ができない' do
    expect{
      fill_in 'ユーザー名', with: nil
      fill_in 'メールアドレス', with: nil
      fill_in 'パスワード', with: nil
      fill_in 'パスワード(確認)', with: nil
      click_on 'ユーザー登録'
    }.to change { User.count }.by(0)
    expect(page).to have_content('メールアドレスを入力してください'), 'メールアドレスに関してのエラーメッセージが表示されていることを確認してください'
    expect(page).to have_content('ユーザー名を入力してください'), 'ユーザー名に関してのエラーメッセージが表示されていることを確認してください'
    expect(page).to have_content('パスワードは6文字以上で入力してください'), 'パスワードに関してのエラーメッセージが表示されていることを確認してください'
    expect(page).to have_content('パスワード(確認)を入力してください'), 'パスワード(確認)に関してのエラーメッセージが表示されていることを確認してください'
  end
  end
end
