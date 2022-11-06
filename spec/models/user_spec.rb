require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'メールアドレスが空では登録できない' do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it 'メールアドレスに@を含むこと' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードがからでは登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは確認と,一致が必須' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it '名前が空では登録できない' do
      @user.first_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it '名字が空では登録できない' do
      @user.last_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
    it '名前のカナが空では登録できない' do
      @user.first_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it '名字のカナが空では登録できない' do
      @user.last_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
    end
    it '名前(全角)カタカナでなければ登録できない' do
      @user.first_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana is invalid")
    end
    it '名字(全角)カタカナでなければ登録できない' do
      @user.last_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana is invalid")
    end
    it '名前は全角(ひらがな,漢字,カタカナ)でなければ登録できない' do
      @user.first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name is invalid")
    end
    it '名字は全角(ひらがな,漢字,カタカナ)でなければ登録できない' do
      @user.last_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name is invalid")
    end
    it '生年月日が空では登録できない' do
      user = FactoryBot.build(:user)  
      user.birth_day = ''  
      user.valid?
      expect(user.errors.full_messages).to include ("Birth day can't be blank")
    end
  end
end
