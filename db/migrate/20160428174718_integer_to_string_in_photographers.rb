class IntegerToStringInPhotographers < ActiveRecord::Migration
  def change
  	change_column :photographers, :tempi_consegna, :string
  	change_column :photographers, :num_foto, :string
  	change_column :photographers, :durata_video, :string
  end
end
