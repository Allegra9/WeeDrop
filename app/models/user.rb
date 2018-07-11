class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true, length: 2..20
  validates :password, presence: true, length: 6..20
end
