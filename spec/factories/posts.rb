FactoryBot.define do
  factory :post do
    subject            { '社会科' }
    course             { '日本史B' }
    unit               { '大航海時代' }
    teaching_materials { '山川出版社日本史B' }
    introduction       { 'テストテストテストテストテストテスト' }
    introduction_time  { 5 }
    development        { 'テストテストテストテストテストテスト'  }
    development_time   { 35 } 
    summary            { 'テストテストテストテストテストテスト'  }
    summary_time       { 10 }

    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
  end
end
