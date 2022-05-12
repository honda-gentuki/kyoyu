class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many_attached :images


  def liked_by?(_user)
    likes.where(user_id: user_id).exists?
  end
end
