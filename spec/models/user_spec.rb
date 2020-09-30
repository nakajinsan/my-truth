require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'userを登録できる場合' do
      it "name、email、passwordとpassword_confirmationが存在する" do
        user = build(:user)
        expect(user).to be_valid
      end

      it " passwordが6文字以上であれば " do
        user = build(:user, password: "000000", password_confirmation: "000000")
        expect(user).to be_valid
      end
    end  


    context 'userを登録できない場合' do
      it "nameがない事" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "emailがない事" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "passwordがない事" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "passwordが存在してもpassword_confirmationがない事" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "重複したemailが存在する事" do
        #はじめにユーザーを登録
        user = create(:user)
        #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
      
      it " passwordが5文字以下である事 " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end
end