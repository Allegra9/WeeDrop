class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :email_address
      t.string :cardholder_name
      t.integer :card_number
      t.integer :cvv
      t.integer :card_expiry_month
      t.integer :card_expiry_year
      t.string :delivery_address
      t.string :delivery_postcode
      t.string :billing_address
      t.string :billing_postcode

      t.timestamps
    end
  end
end
