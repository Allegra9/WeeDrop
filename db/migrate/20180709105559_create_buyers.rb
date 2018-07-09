class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :delivery_address
      t.string :delivery_postcode
      t.string :billing_address
      t.string :billing_postcode

      t.timestamps
    end
  end
end
