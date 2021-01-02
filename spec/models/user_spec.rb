require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
   it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
     user = build(:user)
     expect(user).to be_valid  # user.valid? が true になればパスする
   end

   it "名前がなければサインアップできない" do
     user = build(:user,name: "")
     user.valid?
     expect(user.errors[:name]).to include("が空になっています")
   end
   it "emailが空だと登録できない" do
     user = build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("が空になっています")
   end
   it "emailに@がないと登録できない " do
     user = build(:user, email: "aaaaaa")
     user.valid?
     expect(user.errors[:email]).to include("は有効でありません。")
   end
   it "passwordが空だと登録できない" do
     user = build(:user, password: "")
     user.valid?
     expect(user.errors[:password]).to include("が空になっています")
   end
   it "password_confirmationが空だと登録できない" do
     user = build(:user, password_confirmation: "")
     user.valid?
     expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
   end
   it "password と password_confirmationが一致していないと登録できない" do
     user = build(:user, password: "abcd123" ,password_confirmation: "1234abc")
     user.valid?
     expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
   end
   it "passwordが7文字以下だと登録できない" do
     user = build(:user, password: "1234567")
     user.valid?
     expect(user.errors[:password]).to include("は8文字以上に設定して下さい。") 
   end
  end
end
end
