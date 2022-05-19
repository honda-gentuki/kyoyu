class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags
  validates :tag_name,  uniqueness: true
end
