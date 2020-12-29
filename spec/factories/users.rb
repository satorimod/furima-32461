FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    last_name             { '漢字' }
    first_name            { '漢字' }
    furigana_last_name    { 'カナ' }
    furigana_first_name   { 'カナ' }
    dob                   { '1990-12-12' }
    email                 { 'test@example' }
    password              { 'aiu456' }
    password_confirmation { password }
  end
end
