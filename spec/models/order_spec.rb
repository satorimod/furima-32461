require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it '郵便番号、都道府県、市区町村、番地、電話番号、tokenが正しく入力されていれば登録ができること' do
    expect(@order).to be_valid
  end

  it '郵便番号が空では登録できないこと' do
    @order.postal = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal can't be blank")
  end

  it '郵便番号に-が抜けていたら登録できないこと' do
    @order.postal = '1234567'
    @order.valid?
    expect(@order.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
  end

  it '都道府県が空では登録できないこと' do
    @order.prefecture_id = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
  end

  it '市区町村が空では登録できないこと' do
    @order.municipality = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Municipality can't be blank")
  end

  it '番地が空では登録できないこと' do
    @order.address = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end

  it '電話番号が空では登録できないこと' do
    @order.phone = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone can't be blank")
  end

  it '電話番号に-が入っていたら登録できないこと' do
    @order.phone = '090-1234-5678'
    @order.valid?
    expect(@order.errors.full_messages).to include('Phone is invalid')
  end

  it '電話番号が12桁以上だと登録できないこと' do
    @order.phone = '0901234567890'
    @order.valid?
    expect(@order.errors.full_messages).to include('Phone is invalid')
  end

  it 'tokenが空では登録できないこと' do
    @order.token = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end
