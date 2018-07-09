class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :is_seller
      t.integer :class_id

      t.timestamps
    end
  end
end
