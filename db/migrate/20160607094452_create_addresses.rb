class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :indirizzo
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
