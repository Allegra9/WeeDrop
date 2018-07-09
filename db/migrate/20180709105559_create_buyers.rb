class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :username
      t.string :password_digest
      t.string :delivery_address
      t.string :delivery_address_postcode
      t.string :billing_address
      t.string :billing_address_postcode

      t.timestamps
    end
  end
end
