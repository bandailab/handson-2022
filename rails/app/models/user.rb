class User < ApplicationRecord
  has_many :Posts
  has_secure_password
  before_save { self.email = email.downcase } #emailを全部小文字に変換
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :introduction, presence: true, length: { maximum: 170 }
end
