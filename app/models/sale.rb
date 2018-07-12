class Sale < ApplicationRecord
  belongs_to :buyer
  has_many :prod_sales
  has_many :products, through: :prod_sales
  belongs_to :seller

end
