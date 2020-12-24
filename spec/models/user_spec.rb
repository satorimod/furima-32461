require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "すべての項目が存在すれば登録できる" do 
       expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが11文字以上であれば登録できない" do
        @user.nickname = "aaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 10 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "@がない場合は登録できない" do
        @user.email = "sample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "last_nameがない場合登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角以外は登録できない" do
        @user.last_name = "zennkaku"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameがない場合登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角以外は登録できない" do
        @user.first_name = "zennkaku"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "furigana_last_nameがない場合登録できない" do
        @user.furigana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
      end
      it "furigana_last_nameが全角以外は登録できない" do
        @user.furigana_last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name is invalid")
      end
      it "furigana_first_nameがない場合登録できない" do
        @user.furigana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name can't be blank")
      end        
      it "furigana_first_nameが全角以外は登録できない" do
        @user.furigana_first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字5文字以下であれば登録できない" do
        @user.password = "ai234"
        @user.password_confirmation = "ai234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英語のみは登録できない" do
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it "passwordが数字のみは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it "passwordが全角英数混合は登録できない" do
        @user.password = "AIU１２３"
        @user.password_confirmation = "AIU１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'dobがない場合登録できない' do
        @user.dob = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Dob can't be blank")
      end
    end
  end
end
