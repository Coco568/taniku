require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーを新規作成するとき' do
    it 'ユーザー名、メールアドレス、パスワードを入力した場合、ユーザー登録に成功する' do
     user = build(:user)
     expect(user).to be_valid
     expect(user.errors).to be_empty
    end

    it 'ユーザー名を空欄にした場合、ユーザー登録に失敗する' do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it 'メールアドレスを空欄にした場合、ユーザー登録に失敗する' do
      user_without_email = build(:user, email: "" )
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["を入力してください"]
    end

    it 'メールアドレスを同じにした場合、ユーザー登録に失敗する' do
      user = create(:user)
      user_same_email = build(:user, email: user.email )
      expect(user_same_email).to be_invalid
      expect(user_same_email.errors[:email]).to eq ["はすでに存在します"]
    end

    it 'パスワードを空欄にした場合、ユーザー登録に失敗する' do
      user_without_password = build(:user, password: "" )
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq ["は6文字以上で入力してください"]
    end
  end
end
