class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many_attached :images

  def liked_by?(_user)
    likes.where(user_id: user_id).exists?
  end

  with_options presence: true do
    validates :subject
    validates :course
    validates :unit
    validates :teaching_materials
  end

  validates :introduction, length: { maximum: 300 }
  validates :development,  length: { maximum: 1000 }
  validates :summary,      length: { maximum: 300 }
  validates :images, length: { maximum: 5, message: "は5枚以下にしてください" }

  with_options numericality: { only_integer: true, less_than_or_equal_to: 50 } do
    validates :introduction_time
    validates :development_time
    validates :summary_time
  end
end
