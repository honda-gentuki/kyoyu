require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できるとき' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空ではでは登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaa1'
        @user.password_confirmation = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordとpassword_confirmationの値が一致しなければ登録できない' do
        @user.password = 'aaa222'
        @user.password_confirmation = 'bbb333'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '222222'
        @user.password_confirmation = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end

      it 'first_nameが全角以外(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.first_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include("名には全角文字を使用してください")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it 'last_nameが全角以外(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓には全角文字を使用してください")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メイを入力してください")
      end

      it 'first_name_kanaが全角以外（カタカナ）以外では登録できない' do
        @user.first_name_kana = '一郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('メイには全角カナ文字を使用してください')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("セイを入力してください")
      end

      it 'lsst_name_kanaが全角以外（カタカナ）以外では登録できない' do
        @user.last_name_kana = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include("セイには全角カナを使用してください")
      end
    end
  end
end
