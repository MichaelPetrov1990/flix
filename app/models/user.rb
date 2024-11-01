class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, format: { with: /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/}, uniqueness: { case_sensitive: false }
end
