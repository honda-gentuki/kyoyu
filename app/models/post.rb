class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :subject
    validates :course
    validates :unit
    validates :teaching_materials
  end

  with_options presence: true do
    validates :introduction, length: { maximum: 300 }
    validates :development,  length: { maximum: 1000 }
    validates :summary,      length: { maximum: 300 }
  end

  with_options numericality: { only_integer: true } do
    validates :introduction_time
    validates :development_time
    validates :summary_time
  end
end