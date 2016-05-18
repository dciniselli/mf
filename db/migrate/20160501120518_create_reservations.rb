class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :photographer, index: true, foreign_key: true
      t.datetime :data
      t.string :indirizzo
      t.integer :status
      t.integer :total
      t.integer :offer
      t.string :tempi_consegna
      t.string :num_foto
      t.string :durata_video
      t.text :imprevisti
      t.text :cancellazione
      t.boolean :foto_cerimonia
      t.boolean :video_cerimonia
      t.boolean :foto_pre
      t.boolean :foto_post
      t.boolean :video_pre
      t.boolean :video_post
      t.boolean :prematrimoniale_foto
      t.boolean :prematrimoniale_video
      t.boolean :trash_dress_foto
      t.boolean :trash_dress_video
      t.boolean :second_camera
      t.boolean :second_videocamera
      t.boolean :negativi
      t.boolean :foto_hd
      t.boolean :trailer_foto
      t.boolean :trailer_video
      t.boolean :drone
      t.integer :num_album
      t.integer :num_mini_album
      t.integer :num_dvd
      t.integer :trasferta
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
