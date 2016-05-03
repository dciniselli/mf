class AddExtraFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :telefono, :string
    add_column :users, :descrizione, :text
  end
end
