class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :nome, :string
  	add_column :users, :confirmation_token, :string
  	add_column :users, :confirmed_at, :datetime
  	add_column :users, :confirmation_sent_at, :datetime
  	add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string
    add_column :users, :telefono, :string
    add_column :users, :descrizione, :text
    add_column :users, :indirizzo, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float

  	add_index :users, :confirmation_token, unique: true
  end
end
