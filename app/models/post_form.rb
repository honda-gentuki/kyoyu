class PostForm
  include ActiveModel::Model

  attr_accessor(
    :subject, :course, :unit, :introduction, :introduction_time, :development, :development_time, :summary, :summary_time, :teaching_materials, :images,
    :id, :user_id, :created_at, :updated_at, :datetime,
    :tag_name
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
    Post.create(subject: subject, course: course, unit: unit, introduction: introduction, introduction_time: introduction_time,
                development: development, development_time: development_time, summary: summary, summary_time: summary_time, teaching_materials: teaching_materials, images: images, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    PostTag.create(post_id: post.id, tag_id: tag.id)
  end

  def update(params, post)
    post.post_tags.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    post.update(params)
    PostTag.create(post_id: post.id, tag_id: tag.id) if tag_name.present?
  end
end
