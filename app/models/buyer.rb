class Buyer < ApplicationRecord
  has_many :sales
  has_many :products, through: :sales

  has_secure_password
end
