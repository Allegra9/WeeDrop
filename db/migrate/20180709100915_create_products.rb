class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :seller, foreign_key: true
      t.string :name
      t.float :price
      t.string :description
      t.string :img_url

      t.timestamps
    end
  end
end
