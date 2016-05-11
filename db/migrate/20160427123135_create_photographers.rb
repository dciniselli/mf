class CreatePhotographers < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.string :nome
      t.string :titolo
      t.text :descrizione
      t.string :indirizzo
      t.text :imprevisti
      t.text :cancellazione
      t.integer :foto_cerimonia
      t.integer :video_cerimonia
      t.integer :foto_pre
      t.integer :video_pre
      t.integer :foto_post
      t.integer :video_post
      t.integer :second_camera
      t.integer :second_videocamera
      t.integer :album
      t.integer :mini_album
      t.integer :foto_hd
      t.integer :negativi
      t.integer :dvd
      t.integer :trailer_foto
      t.integer :trailer_video
      t.integer :drone
      t.string :tempi_consegna
      t.string :num_foto
      t.string :durata_video
      t.float :latitude
      t.float :longitude
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
