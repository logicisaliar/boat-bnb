class AddCoordinatesToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :lat, :float
    add_column :boats, :lon, :float
  end
end
