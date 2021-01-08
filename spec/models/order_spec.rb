require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
   @order = FactoryBot.build(:order)
  end

  it "郵便番号、都道府県、都市、番地、電話番号があれば保存ができること" do
    expect(@order).to be_valid
  end
end  
