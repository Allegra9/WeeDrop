class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :username
      t.string :password_digest
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
