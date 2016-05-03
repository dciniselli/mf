class AddCancellazioneToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :cancellazione, :text
  end
end
