require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it 'nickname,family_name,first_name,familiy_name_kana,first_name_kana,birth_day,eamil,passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で、英数混同であれば登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it '名字は全角（漢字・ひらがな・カタカナ）で入力すると登録できる' do
        @user.family_name = '福井ふくいフクイ'
        expect(@user).to be_valid
      end
      it '名前は全角（漢字・ひらがな・カタカナ）で入力すると登録できる' do
        @user.first_name = '翔平しょうへいショウヘイ'
        expect(@user).to be_valid
      end
      it '名字のフリガナは全角(カタカナ)で入力すると登録できる' do
        @user.family_name_kana = 'フクイ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emalが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emalに@が含まれていないと登録できない' do
        @user.email = 'aaa.gamil.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードは６文字以上かつ、半角英数字混同でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが存在しても、確認用が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '名字は全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.family_name = 'jackson'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it '名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前は全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name = 'michael'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名字のフリガナが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it '名字のフリガナは全角(カタカナ)で入力しないと登録できない' do
        @user.family_name_kana = 'ﾌｸｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it '名前のフリガナが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前のフリガナは全角(カタカナ)で入力しないと登録できない' do
        @user.first_name_kana = 'ｼｮｳﾍｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
