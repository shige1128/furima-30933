require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとfamily_nameとfirst_nameとfamily_name_kanaとfirt_name_kanaとemailとpasswordとpassword_confirmationとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'family_nameが全角文字なら登録できる' do
        @user.family_name = Gimei.last
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字なら登録できる' do
        @user.first_name = Gimei.first
        expect(@user).to be_valid
      end
      it 'family_name_kanaがカタカナなら登録できる' do
        @user.family_name_kana = Gimei.last.katakana
        expect(@user).to be_valid
      end
      it 'first_name_kanaがカタカナであれば登録できる' do
        @user.first_name_kana = Gimei.first.katakana
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'famiy_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'pssswordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcDEF'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは全角英数混合では登録できない' do
        @user.password = 'ＡＢＣＤＥＦ１'
        @user.password_confirmation = 'ＡＢＣＤＥＦ１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '重複したemailがあると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = @user.email.delete('@')
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'family_nameは全角文字でないと登録できない' do
        @user.family_name = 'zenkaku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameは全角文字でないと登録できない' do
        @user.first_name = 'zenkaku'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_name_kanaはカタカナでないと登録できない' do
        @user.family_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'first_name_kanaはカタカナでないと登録できない' do
        @user.first_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end
