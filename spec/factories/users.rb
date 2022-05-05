FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.last_name }
    email                   { Faker::Internet.free_email }
    password                { 'suzuki12345' }
    password_confirmation   { password }
    first_name              { '一郎' }
    last_name               { '鈴木' }
    first_name_kana         { 'イチロウ' }
    last_name_kana          { 'スズキ' }
  end
end
