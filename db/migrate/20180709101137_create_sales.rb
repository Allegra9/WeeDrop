class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.belongs_to :buyer, foreign_key: true
      t.belongs_to :seller, foreign_key: true
      t.string :status
      t.float :total

      t.timestamps
    end
  end
end
