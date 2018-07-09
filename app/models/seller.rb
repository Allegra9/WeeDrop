class Seller < ApplicationRecord
  has_many :products
  has_many :sales, through: :products

  has_secure_password
end
