class Buyer < ApplicationRecord
  has_many :sales
  has_many :products, through: :sales

  validates :name, presence: true, length: 2..20

  validates :cardholder_name, presence: true, format: { with: /\b[^\d\W]+\b/i, message: "can only have valid characters" }, length: 2..20, :on => :update
  validates :card_number, presence: true, numericality: { only_integer: true }, length: { is: 16 }, :on => :update

  validates :email_address, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, presence: true, :on => :update

  validates :cvv, presence: true, numericality: { only_integer: true }, length: { is: 3 }, :on => :update
  validates :card_expiry_year, presence: true, :on => :update

  validates :billing_address, presence: true, length: 2..30, :on => :update
  validates :delivery_address, presence: true, length: 2..30, :on => :update

  validate :card_is_not_expired?

  validate :check_billing_postcode?
  validate :check_delivery_postcode?

 # this should prevent expired cards
  def card_is_not_expired?
    if self.card_expiry_month != nil
      if self.card_expiry_year == Time.now.strftime("%Y").to_i && self.card_expiry_month < Time.now.strftime("%-m").to_i
        errors.add(:card_expiry_month, "must be valid")
      end
    end
  end

  # added to the Gemfile: gem "uk_postcode", "~> 2.1.0"
  def check_billing_postcode?
    if billing_postcode != nil
      ukpc = UKPostcode.parse(billing_postcode)
        unless ukpc.full_valid?
          errors.add(:billing_postcode, "not recognised as a UK postcode")
      end
    end
  end

  def check_delivery_postcode?
    if delivery_postcode != nil
      ukpc = UKPostcode.parse(delivery_postcode)
        unless ukpc.full_valid?
          errors.add(:delivery_postcode, "not recognised as a UK postcode")
      end
    end
  end

end
