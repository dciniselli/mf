class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :indirizzo
      t.date :datetime
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
