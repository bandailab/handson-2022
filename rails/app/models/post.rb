class Post < ApplicationRecord
  belongs_to :user

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :post_tags

  validates :title, presence: true
end
