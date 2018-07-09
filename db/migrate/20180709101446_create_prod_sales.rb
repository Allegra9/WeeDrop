class CreateProdSales < ActiveRecord::Migration[5.2]
  def change
    create_table :prod_sales do |t|
      t.belongs_to :sale, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
