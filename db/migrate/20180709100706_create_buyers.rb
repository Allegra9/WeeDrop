class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :billing_address
      t.string :delivery_address

      t.timestamps
    end
  end
end
