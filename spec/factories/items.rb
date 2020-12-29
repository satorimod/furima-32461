FactoryBot.define do
  factory :item do
    name            { 'ネーム' }
    explanation     { 'MyString' }
    category_id        { 3 }
    item_state_id      { 3 }
    shipping_area_id   { 3 }
    shipping_charge_id { 3 }
    shipping_date_id   { 3 }
    price { 3000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image1.png'), filename: 'output-image1.png')
    end
  end
end
