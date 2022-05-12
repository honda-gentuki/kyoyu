test_user_1 = User.create(nickname: "太郎", email: "taro@taro", password: "tarotaro")
test_user_2 = User.create(nickname: "花子", email: "hanako@hanako", password: "hanakohanako")

post_1 = Post.new(
  subject: "社会科",
  course: "政治経済",
  unit: "選挙",
  teaching_materials: "山川出版(政治経済)",
  introduction: "テスト導入",
  introduction_time: 5,
  development: "テスト展開",
  development_time: 40,
  summary: "テストまとめ",
  summary_time: 5,
  user_id: test_user_1.id
 )
poat_1.image.attach(io: File.open(Rails.root.join("./app/assets/images/job_teacher_man.png")), filename: '.png')
poat_1.save

post_2 = Item.new(
  subject: "数学",
  course: "数学Ⅰ",
  unit: "２次関数",
  teaching_materials: "山川出版(数学Ⅰ)",
  introduction: "テスト導入",
  introduction_time: 5,
  development: "テスト展開",
  development_time: 40,
  summary: "テストまとめ",
  summary_time: 5,
  user_id: test_user_2.id
 )
post_2.image.attach(io: File.open(Rails.root.join("./app/assets/images/job_teacher_woman.png")), filename: 'job_teacher_woman.png')
post_2.save
