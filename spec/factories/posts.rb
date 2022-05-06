FactoryBot.define do
  factory :post do
    subject            { '社会科' }
    course             { '日本史B' }
    unit               { '大航海時代' }
    teaching_materials { '山川出版社日本史B' }
    introduction       { '導入は５分です。' }
    introduction_time  { '5' }
    development        { '展開は３５分です。' }
    development_time   { '35' } 
    summary            { 'まとめは１０分です。' }
    summary_time       { '10' }
  end
end
