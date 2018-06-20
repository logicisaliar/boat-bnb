class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :lat, :latitude
    rename_column :boats, :lon, :longitude

  end
end
