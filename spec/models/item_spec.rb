require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe 'ユーザー新規登録' do
      context '商品出品がうまくいくとき' do
        it '全ての値が存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'nameが空では登録できないこと' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'explanationが空では登録できないこと' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'category_idが空では登録できないこと' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'category_idが1では登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'item_state_idが空では登録できないこと' do
          @item.item_state_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item state can't be blank")
        end
        it 'item_state_idが1では登録できないこと' do
          @item.item_state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Item state must be other than 1')
        end
        it 'shipping_area_idが空では登録できないこと' do
          @item.shipping_area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end
        it 'shipping_area_idが１では登録できないこと' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
        end
        it 'shipping_charge_idが空では登録できないこと' do
          @item.shipping_charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end
        it 'shipping_charge_idが1では登録できないこと' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
        end
        it 'shipping_date_idが空では登録できないこと' do
          @item.shipping_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
        end
        it 'shipping_date_idが1では登録できないこと' do
          @item.shipping_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
        end
        it 'priceが空では登録できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが299以下では登録できないこと' do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 300')
        end
        it 'priceが10,000,000以上では登録できないこと' do
          @item.price = 100000000000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than 9999999')
        end
        it "priceが全角数字では出品できないこと" do
          @item.price = １００００
          @item.valid? 
         expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end
