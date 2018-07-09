class Product < ApplicationRecord
  belongs_to :seller
  has_many :prod_sales
  has_many :sales, through: :prod_sales
end
