class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def liked_by?(user)
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

  with_options numericality: { only_integer: true, less_than_or_equal_to: 50 } do
    validates :introduction_time
    validates :development_time
    validates :summary_time
  end
end
