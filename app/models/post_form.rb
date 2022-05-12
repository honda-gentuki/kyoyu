class PostForm
  include ActiveModel::Model

  attr_accessor(
  :subject, :course, :unit, :introduction, :introduction_time, :development, :development_time, :summary, :summary_time, :teaching_materials,
  :id, :user_id, :created_at, :updated_at, :images
  )

  with_options presence: true do
    validates :subject
    validates :course
    validates :unit
    validates :teaching_materials
  end

  validates :introduction, length: { maximum: 300 }
  validates :development,  length: { maximum: 1000 }
  validates :summary,      length: { maximum: 300 }
  validates :images, length: { maximum: 5, message: 'は5枚以下にしてください' }

  with_options numericality: { only_integer: true, less_than_or_equal_to: 50 } do
    validates :introduction_time
    validates :development_time
    validates :summary_time
  end

  def save
    Post.create(subject: subject, course: course, unit: unit, introduction: introduction, introduction_time: introduction_time, development: development, development_time: development_time,summary: summary, summary_time: summary_time, teaching_materials: teaching_materials, images: images, user_id: user_id)
  end


end
