class RemovePhotographerFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :photographer_id
  end
end
