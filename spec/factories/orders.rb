FactoryBot.define do
  factory :order do
    postal {'123-4567'}
    prefecture_id {4}
    municipality  {'横浜'}
    address {'青山1-1-1-1'}
    phone   {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
