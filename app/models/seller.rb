class Seller < ApplicationRecord
  has_many :products
  has_many :sales, through: :products

  validates :name, presence: true, length: 2..20
  validates :address, presence: true, length: 2..30
  validate :check_postcode?

  # added to the Gemfile: gem "uk_postcode", "~> 2.1.0"
  def check_postcode?
    ukpc = UKPostcode.parse(postcode)
      unless ukpc.full_valid?
        errors.add(:postcode, "not recognised as a UK postcode")
      end
  end

end
