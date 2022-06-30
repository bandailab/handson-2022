class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  validates :title, presence: true
end
