class User < ApplicationRecord
  validates :user_id, {presence: true, uniqueness: true}
  validates :password, {presence: true, confirmation: true,
                        length: { in: 4..15}}
  validates :email, uniqueness: true
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
