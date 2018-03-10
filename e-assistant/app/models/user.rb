class User < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :password, {presence: true, confirmation: true,
                        length: { in: 4..15}}
  validates :email, uniqueness: true
end
