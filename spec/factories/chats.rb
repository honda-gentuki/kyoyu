FactoryBot.define do
  factory :chat do
    user_id { nil }
    room_id { nil }
    message { 'MyText' }
  end
end
