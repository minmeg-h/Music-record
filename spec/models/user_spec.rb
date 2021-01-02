require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規作成#create' do
    it 'name、email、passwordとpassword_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end

    it '名前がなければサインアップできない' do
      user = build(:user, name: '')
      user.valid?
      expect(user.errors[:name]).to include('が空になっています')
    end

    it '名前が20文字以下でなければサインアップできない' do
      user = build(:user, name: 'a' * 21)
      user.valid?
      expect(user.errors[:name]).to include('は20文字以下に設定して下さい。')
    end

    it 'emailが空だと登録できない' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('が空になっています')
    end

    it 'emailに@がないと登録できない' do
      user = build(:user, email: 'aaaaaa')
      user.valid?
      expect(user.errors[:email]).to include('は有効でありません。')
    end

    it 'passwordが空だと登録できない' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include('が空になっています')
    end

    it 'password_confirmationが空だと登録できない' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('が内容とあっていません。')
    end

    it 'password と password_confirmationが一致していないと登録できない' do
      user = build(:user, password: 'abcd1234', password_confirmation: '1234abcd')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('が内容とあっていません。')
    end

    it 'passwordが7文字以下だと登録できない' do
      user = build(:user, password: '1234567')
      user.valid?
      expect(user.errors[:password]).to include('は8文字以上に設定して下さい。')
    end

    it 'パスワードに大文字が1文字以上ない' do
      user = build(:user, password: 'aaaa1234')
      user.valid?
      expect(user.errors[:password]).to include('パスワードの強度が不足しています。パスワードの長さは8文字以上とし、大文字と小文字と数をそれぞれ1文字以上含める必要があります。')
    end

    it 'パスワードに小文字が1文字以上ない' do
      user = build(:user, password: 'ABCD1234')
      user.valid?
      expect(user.errors[:password]).to include('パスワードの強度が不足しています。パスワードの長さは8文字以上とし、大文字と小文字と数をそれぞれ1文字以上含める必要があります。')
    end

    it 'パスワードに数字が1文字以上ない' do
      user = build(:user, password: 'ABCDehgh')
      user.valid?
      expect(user.errors[:password]).to include('パスワードの強度が不足しています。パスワードの長さは8文字以上とし、大文字と小文字と数をそれぞれ1文字以上含める必要があります。')
    end
  end
  pending describe 'ログイン' do
    it 'パスワードが間違えているとエラーがでること' do
      expect(user.errors[:password]).to include('メールアドレスまたはパスワードが違います。')
    end
  end

  describe 'プロフィールの編集' do
  end
end
